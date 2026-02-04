import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/document_upload_widget.dart';
import '../widgets/generation_controls_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> uploadedDocuments = [];
  bool isGenerating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudyForge'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Application d\'étude locale',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DocumentUploadWidget(
              onDocumentsUploaded: (documents) {
                setState(() {
                  uploadedDocuments = documents;
                });
              },
            ),
            const SizedBox(height: 20),
            if (uploadedDocuments.isNotEmpty) ...[
              GenerationControlsWidget(
                documents: uploadedDocuments,
                onGenerationStart: () {
                  setState(() {
                    isGenerating = true;
                  });
                },
                onGenerationComplete: () {
                  setState(() {
                    isGenerating = false;
                  });
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}