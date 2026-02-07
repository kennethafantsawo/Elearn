import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:hive/hive.dart';
import 'package:crypto/crypto.dart';
import '../models/document_model.dart';

class DocumentService {
  static const String _documentsBoxName = 'documents';

  // Initialiser le service
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DocumentAdapter());
    await Hive.openBox<Document>(_documentsBoxName);
  }

  // Chiffrer un document avant de le stocker
  Future<String> encryptAndSaveDocument(String filePath) async {
    File originalFile = File(filePath);
    String fileName = path.basename(filePath);
    String encryptedFilePath = '${await getDocumentsDirectory()}/encrypted_$fileName';

    // Pour l'instant, on copie simplement le fichier
    // Dans une implémentation complète, on ajouterait AES-256
    await originalFile.copy(encryptedFilePath);

    return encryptedFilePath;
  }

  // Calculer le hash SHA-256 d'un fichier
  Future<String> calculateSHA256(String filePath) async {
    File file = File(filePath);
    List<int> fileBytes = await file.readAsBytes();
    Digest digest = sha256.convert(fileBytes);
    return digest.toString();
  }

  // Catégoriser automatiquement un document
  String categorizeDocument(String fileName) {
    String lowerFileName = fileName.toLowerCase();
    
    if (lowerFileName.contains('epreu') || 
        lowerFileName.contains('exam') || 
        lowerFileName.contains('test') ||
        lowerFileName.contains('concour')) {
      return 'Épreuves';
    } else if (lowerFileName.contains('fiche') || 
               lowerFileName.contains('summary') || 
               lowerFileName.contains('résumé')) {
      return 'Fiches existantes';
    } else {
      return 'Cours';
    }
  }

  // Sauvegarder un document dans la base locale
  Future<void> saveDocument(String filePath) async {
    String fileName = path.basename(filePath);
    File file = File(filePath);
    int fileSize = await file.length();
    String fileType = path.extension(filePath).substring(1).toLowerCase();
    String hash = await calculateSHA256(filePath);
    String category = categorizeDocument(fileName);
    String encryptedPath = await encryptAndSaveDocument(filePath);

    Document document = Document(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      path: encryptedPath,
      title: fileName,
      category: category,
      createdAt: DateTime.now(),
      size: fileSize,
      hash: hash,
      fileType: fileType,
    );

    Box<Document> box = Hive.box<Document>(_documentsBoxName);
    await box.put(document.id, document);
  }

  // Récupérer tous les documents
  List<Document> getAllDocuments() {
    Box<Document> box = Hive.box<Document>(_documentsBoxName);
    return box.values.toList();
  }

  // Récupérer les documents par catégorie
  List<Document> getDocumentsByCategory(String category) {
    Box<Document> box = Hive.box<Document>(_documentsBoxName);
    return box.values.where((doc) => doc.category == category).toList();
  }

  // Supprimer un document
  Future<void> deleteDocument(String id) async {
    Box<Document> box = Hive.box<Document>(_documentsBoxName);
    await box.delete(id);
  }

  // Fermer le service
  Future<void> close() async {
    await Hive.close();
  }
}