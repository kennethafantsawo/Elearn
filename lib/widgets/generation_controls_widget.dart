import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class GenerationControlsWidget extends StatefulWidget {
  final List<String> documents;
  final VoidCallback onGenerationStart;
  final VoidCallback onGenerationComplete;

  const GenerationControlsWidget({
    super.key,
    required this.documents,
    required this.onGenerationStart,
    required this.onGenerationComplete,
  });

  @override
  State<GenerationControlsWidget> createState() => _GenerationControlsWidgetState();
}

class _GenerationControlsWidgetState extends State<GenerationControlsWidget> {
  bool _isLoading = false;
  String _generationType = 'general'; // 'general' or 'precise'

  void _generateNotes() async {
    if (widget.documents.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    widget.onGenerationStart();

    try {
      // Déterminer le type de génération en fonction des documents
      String type = _determineGenerationType(widget.documents);
      
      AIService aiService = AIService();
      String generatedNotes = await aiService.generateNotes(
        widget.documents,
        type: type,
      );

      // Afficher les notes générées
      _showGeneratedNotes(generatedNotes);
    } catch (e) {
      _showErrorDialog('Erreur lors de la génération: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
      widget.onGenerationComplete();
    }
  }

  String _determineGenerationType(List<String> documents) {
    // Pour cette version initiale, on utilise un simple détecteur de présence
    // de mots clés dans les noms de fichiers pour déterminer le mode
    bool hasExamsOrQuestions = documents.any((doc) => 
      doc.toLowerCase().contains('epreuve') || 
      doc.toLowerCase().contains('exam') || 
      doc.toLowerCase().contains('question') ||
      doc.toLowerCase().contains('fiche')
    );

    return hasExamsOrQuestions ? 'precise' : 'general';
  }

  void _showGeneratedNotes(String notes) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          maxChildSize: 0.9,
          initialChildSize: 0.7,
          minChildSize: 0.3,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Fiche de révision générée',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: SelectableText(notes),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Exporter PDF'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.text_snippet),
                        label: const Text('Exporter TXT'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Options de génération',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: [
                FilterChip(
                  label: const Text('Mode Général'),
                  selected: _generationType == 'general',
                  onSelected: (bool selected) {
                    setState(() {
                      _generationType = selected ? 'general' : 'precise';
                    });
                  },
                ),
                FilterChip(
                  label: const Text('Mode Précis'),
                  selected: _generationType == 'precise',
                  onSelected: (bool selected) {
                    setState(() {
                      _generationType = selected ? 'precise' : 'general';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _generateNotes,
                icon: _isLoading
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.auto_fix_high),
                label: Text(_isLoading ? 'Génération en cours...' : 'Générer la fiche de révision'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}