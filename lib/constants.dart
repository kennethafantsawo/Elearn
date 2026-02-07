// ignore_for_file: non_constant_identifier_names

class AppConstants {
  // App Info
  static const String APP_NAME = 'StudyForge';
  static const String APP_VERSION = '1.0.0';
  static const String DEVELOPER = 'Kenneth Afantsawo';

  // Network
  static const int NETWORK_TIMEOUT = 30000; // milliseconds
  static const int MAX_RETRIES = 3;

  // Storage
  static const String HIVE_BOX_DOCUMENTS = 'documents';
  static const String HIVE_BOX_SETTINGS = 'settings';

  // AI Models
  static const String TINY_LLAMA_MODEL = 'assets/models/TinyLlama-1.1B-Chat-v1.0.Q3_K_M.gguf';
  static const String PHI3_MODEL = 'assets/models/phi-3-mini-4k-instruct.Q4_K_M.gguf';

  // RAM Detection (MB)
  static const int MIN_RAM_FOR_LARGE_MODEL = 2048; // 2GB
  static const int MIN_RAM_FOR_SMALL_MODEL = 1024; // 1GB

  // File Handling
  static const int MAX_FILE_SIZE = 100 * 1024 * 1024; // 100MB
  static const int MAX_DOCUMENTS = 20;
  static const List<String> SUPPORTED_FORMATS = ['pdf', 'docx', 'txt', 'epub'];

  // Text Processing
  static const int MAX_CHUNK_SIZE = 1000;
  static const double MIN_SIMILARITY_THRESHOLD = 0.7;

  // UI
  static const Duration SHORT_DURATION = Duration(milliseconds: 300);
  static const Duration MEDIUM_DURATION = Duration(milliseconds: 500);
  static const Duration LONG_DURATION = Duration(seconds: 1);
}
