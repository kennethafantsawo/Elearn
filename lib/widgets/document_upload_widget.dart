import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

class DocumentUploadWidget extends StatefulWidget {
  final Function(List<String>) onDocumentsUploaded;

  const DocumentUploadWidget({
    super.key,
    required this.onDocumentsUploaded,
  });

  @override
  State<DocumentUploadWidget> createState() => _DocumentUploadWidgetState();
}

class _DocumentUploadWidgetState extends State<DocumentUploadWidget> {
  List<String> _selectedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'txt', 'epub'],
      allowMultiple: true,
      withData: false,
      withReadStream: false,
    );

    if (result != null && result.files.isNotEmpty) {
      // Vérifier le nombre de fichiers
      if (_selectedFiles.length + result.files.length > 20) {
        _showErrorDialog('Maximum 20 documents autorisés');
        return;
      }

      // Vérifier les extensions
      List<String> validExtensions = ['pdf', 'docx', 'txt', 'epub'];
      for (var file in result.files) {
        String? extension = path.extension(file.name).toLowerCase().substring(1);
        if (!validExtensions.contains(extension)) {
          _showErrorDialog('Format de fichier non supporté: ${extension ?? "unknown"}');
          return;
        }
      }

      List<String> newFiles = result.files.map((file) => file.path!).toList();
      setState(() {
        _selectedFiles.addAll(newFiles);
      });

      widget.onDocumentsUploaded(_selectedFiles);
    }
  }

  void _removeFile(String filePath) {
    setState(() {
      _selectedFiles.remove(filePath);
    });
    widget.onDocumentsUploaded(_selectedFiles);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: _pickFiles,
          icon: const Icon(Icons.upload_file),
          label: const Text('Ajouter des documents'),
        ),
        const SizedBox(height: 10),
        if (_selectedFiles.isNotEmpty)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _selectedFiles.length,
              itemBuilder: (context, index) {
                String fileName = path.basename(_selectedFiles[index]);
                return ListTile(
                  dense: true,
                  leading: const Icon(Icons.insert_drive_file),
                  title: Text(fileName),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeFile(_selectedFiles[index]),
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 10),
        Text(
          'Formats supportés: PDF, DOCX, TXT, EPUB | Max 20 documents',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}