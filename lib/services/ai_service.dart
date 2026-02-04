import 'dart:io';
import 'package:llama_dart/llama_dart.dart';
import 'package:pdfx/pdfx.dart';
import 'package:docx_to_text/docx_to_text.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:bm25/bm25.dart';

class AIService {
  late LlamaModel model;
  late String systemPrompt;
  
  // Configuration pour la détection de matériel bas de gamme
  static const int kMinRAMForLargeModel = 2048; // 2GB in MB
  static const int kMinRAMForSmallModel = 1024; // 1GB in MB
  
  // Chemins vers les modèles GGUF
  static const String kTinyLlamaModel = 'assets/models/TinyLlama-1.1B-Chat-v1.0.Q3_K_M.gguf';
  static const String kPhi3Model = 'assets/models/phi-3-mini-4k-instruct.Q4_K_M.gguf';

  // Initialiser le service avec le modèle approprié
  Future<void> initializeModel() async {
    // Détection de la RAM disponible (approximative)
    int availableRAM = await _detectAvailableRAM();
    
    String modelPath;
    if (availableRAM >= kMinRAMForLargeModel) {
      modelPath = kPhi3Model;
    } else {
      modelPath = kTinyLlamaModel;
    }
    
    // Charger le modèle
    try {
      model = await LlamaModel.fromFile(modelPath);
    } catch (e) {
      throw Exception('Impossible de charger le modèle: $e');
    }
    
    // Définir le prompt système avec les règles anti-hallucination
    systemPrompt = '''
RÔLE : Assistant pédagogique strict.
RÈGLES :
TU NE CONNAIS QUE LE TEXT DANS [EXTRAITS SOURCES].
SI UNE QUESTION SORT DU TEXT -> "[NON MENTIONNÉ DANS LE COURS]"
STRUCTURE : Titres H2, puces, termes clés en GRAS.
LANGUE : fr
[EXTRAITS SOURCES]
{chunks_pertinents_concaténés}
''';
  }
  
  // Détection approximative de la RAM disponible
  Future<int> _detectAvailableRAM() async {
    // Sur Android, on peut utiliser la commande dumpsys
    try {
      ProcessResult result = await Process.run('dumpsys', ['meminfo']);
      String output = result.stdout.toString();
      
      // Chercher la ligne qui contient la RAM totale
      RegExp exp = RegExp(r'MemTotal:\s+(\d+)\s+kB');
      Match? match = exp.firstMatch(output);
      
      if (match != null) {
        int totalKB = int.parse(match.group(1)!);
        return totalKB ~/ 1024; // Convertir en Mo
      }
    } catch (e) {
      // Si la détection échoue, on suppose un appareil bas de gamme
      print('Impossible de détecter la RAM: $e');
    }
    
    // Valeur par défaut pour la détection de bas de gamme
    return 1500; // 1.5GB
  }
  
  // Extraire le texte des documents
  Future<List<String>> extractTextFromDocuments(List<String> documentPaths) async {
    List<String> extractedText = [];
    
    for (String path in documentPaths) {
      String extension = path.split('.').last.toLowerCase();
      
      switch (extension) {
        case 'pdf':
          extractedText.add(await _extractTextFromPDF(path));
          break;
        case 'docx':
          extractedText.add(await _extractTextFromDOCX(path));
          break;
        case 'txt':
          extractedText.add(await _extractTextFromTXT(path));
          break;
        case 'epub':
          extractedText.add(await _extractTextFromEPUB(path));
          break;
        default:
          throw Exception('Format non supporté: $extension');
      }
    }
    
    return extractedText;
  }
  
  Future<String> _extractTextFromPDF(String path) async {
    PdfDocument document = await PdfDocument.openFile(path);
    String text = '';
    
    for (int i = 1; i <= document.pagesCount; i++) {
      PdfPage page = await document.getPage(i);
      text += await page.extractText() ?? '';
      page.dispose();
    }
    
    document.dispose();
    return text;
  }
  
  Future<String> _extractTextFromDOCX(String path) async {
    DocxToText docxParser = DocxToText();
    return await docxParser.readDocxAsText(path);
  }
  
  Future<String> _extractTextFromTXT(String path) async {
    File file = File(path);
    return await file.readAsString();
  }
  
  Future<String> _extractTextFromEPUB(String path) async {
    // Pour l'instant, on retourne une chaîne vide car il n'y a pas de package
    // Flutter pour lire les EPUB directement. On pourrait ajouter un package
    // comme epubx plus tard.
    return '';
  }
  
  // Diviser le texte en chunks intelligents
  List<String> chunkText(String text, {int maxChunkSize = 1000}) {
    List<String> chunks = [];
    List<String> paragraphs = text.split('\n\n');
    
    String currentChunk = '';
    
    for (String paragraph in paragraphs) {
      // Si le paragraphe seul dépasse la taille maximale, le diviser
      if (paragraph.length > maxChunkSize) {
        List<String> sentences = paragraph.split('.');
        String tempChunk = '';
        
        for (String sentence in sentences) {
          if ((tempChunk + sentence).length > maxChunkSize) {
            if (tempChunk.isNotEmpty) {
              chunks.add(tempChunk.trim());
              tempChunk = sentence;
            } else {
              tempChunk = sentence;
            }
          } else {
            tempChunk += sentence + '.';
          }
        }
        
        if (tempChunk.isNotEmpty) {
          chunks.add(tempChunk.trim());
        }
      } else {
        // Vérifier si ajouter ce paragraphe dépasse la limite
        if ((currentChunk + paragraph).length > maxChunkSize) {
          if (currentChunk.isNotEmpty) {
            chunks.add(currentChunk.trim());
            currentChunk = paragraph;
          } else {
            currentChunk = paragraph;
          }
        } else {
          currentChunk += '\n\n$paragraph';
        }
      }
    }
    
    // Ajouter le dernier chunk s'il n'est pas vide
    if (currentChunk.isNotEmpty) {
      chunks.add(currentChunk.trim());
    }
    
    return chunks;
  }
  
  // Calculer la similarité entre la fiche générée et les sources
  double calculateSimilarity(String generatedText, List<String> sourceChunks) {
    // Cette méthode simplifiée calcule une similarité basique
    // basée sur la présence de phrases dans les sources
    
    List<String> generatedSentences = generatedText.split('.');
    int matchedSentences = 0;
    
    for (String sentence in generatedSentences) {
      sentence = sentence.trim().toLowerCase();
      if (sentence.isNotEmpty) {
        bool foundInSources = sourceChunks.any((chunk) => 
          chunk.toLowerCase().contains(sentence)
        );
        
        if (foundInSources) {
          matchedSentences++;
        }
      }
    }
    
    return generatedSentences.isNotEmpty 
      ? matchedSentences / generatedSentences.length 
      : 0.0;
  }
  
  // Générer les notes de révision
  Future<String> generateNotes(
    List<String> documentPaths, {
    String type = 'general', // 'general' or 'precise'
    String subject = 'Révision',
  }) async {
    // Extraire le texte des documents
    List<String> texts = await extractTextFromDocuments(documentPaths);
    String combinedText = texts.join('\n\n');
    
    // Diviser le texte en chunks
    List<String> chunks = chunkText(combinedText);
    
    // Utiliser BM25 pour trouver les chunks les plus pertinents
    // (Dans une implémentation complète, on ferait une recherche plus sophistiquée)
    List<String> relevantChunks = chunks.take(10).toList(); // Prendre les 10 premiers chunks pour l'exemple
    
    // Créer le prompt système avec les extraits pertinents
    String promptWithSources = systemPrompt.replaceAll(
      '{chunks_pertinents_concaténés}',
      relevantChunks.join('\n---\n'),
    );
    
    // Déterminer le type de fiche à générer
    String typeDescription = type == 'general' 
      ? 'synthétique globale' 
      : 'ciblée avec focus sur les attentes des examens';
    
    String userPrompt = '''
Crée une fiche de révision $typeDescription sur : "$subject".
''';
    
    // Générer la réponse avec le modèle
    try {
      String response = await model.generate(
        prompt: '$promptWithSources\n\n[INSTRUCTION]\n$userPrompt',
        temperature: 0.3,
        maxTokens: 1024,
      );
      
      // Vérifier la similarité pour éviter les hallucinations
      double similarity = calculateSimilarity(response, relevantChunks);
      if (similarity < 0.7) {
        print('Alerte: Similarité faible (${(similarity * 100).toStringAsFixed(2)}%) entre la fiche générée et les sources');
      }
      
      return response;
    } catch (e) {
      throw Exception('Erreur lors de la génération: $e');
    }
  }
  
  // Méthode pour vérifier la source d'une information spécifique
  List<String> findSourceForInfo(String info, List<String> documentPaths) {
    List<String> sources = [];
    
    for (String path in documentPaths) {
      // Ici, on devrait extraire le texte et chercher l'information
      // Pour l'instant, on fait une recherche simple dans les chunks
    }
    
    return sources;
  }
  
  // Fermer le modèle
  void dispose() {
    model.dispose();
  }
}