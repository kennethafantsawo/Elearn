import 'package:hive/hive.dart';

part 'document_model.g.dart';

@HiveType(typeId: 0)
class Document {
  @HiveField(0)
  String id;

  @HiveField(1)
  String path;

  @HiveField(2)
  String title;

  @HiveField(3)
  String category; // 'Cours', 'Épreuves', 'Fiches existantes'

  @HiveField(4)
  DateTime createdAt;

  @HiveField(5)
  int size; // Taille en octets

  @HiveField(6)
  String hash; // Hash SHA-256

  @HiveField(7)
  String fileType; // 'pdf', 'docx', 'txt', 'epub'

  Document({
    required this.id,
    required this.path,
    required this.title,
    required this.category,
    required this.createdAt,
    required this.size,
    required this.hash,
    required this.fileType,
  });
}