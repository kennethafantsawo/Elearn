# StudyForge - Application d'étude locale avec génération par IA

Bienvenue dans **StudyForge**, une application mobile et web conçue pour vous aider à générer automatiquement des fiches de révision à partir de vos documents.

## 🚀 Getting Started

> **Flutter not installed?** See [INSTALLATION.md](INSTALLATION.md)

Looking for quick help? Choose your path:

| Need | Resource | Time |
|------|----------|------|
| **Installation** | [INSTALLATION.md](INSTALLATION.md) | 10-15 min |
| **Quick Start** | [QUICKSTART.md](QUICKSTART.md) | 5 min |
| **Run the App** | [LIVE_PREVIEW.md](LIVE_PREVIEW.md) | 15-20 min |
| **Set up VS Code** | [VSCODE_SETUP.md](VSCODE_SETUP.md) | 10-12 min |
| **Development** | [DEVELOPMENT.md](DEVELOPMENT.md) | 20-30 min |
| **All Documentation** | [DOCS_INDEX.md](DOCS_INDEX.md) | - |

---

## Features 🎯

- 📱 **Multi-plateforme** : iOS, Android et Web
- 📄 **Support multiformat** : PDF, DOCX, TXT, EPUB
- 🤖 **Génération par IA** : Fiches de révision intelligentes basées sur vos documents
- 🔒 **Stockage local** : Vos données restent sur votre appareil
- 🎨 **Interface intuitive** : Navigation fluide et agréable
- 📊 **Catégorisation automatique** : Cours, Épreuves, Fiches existantes

## Architecture 🏗️

```
StudyForge/
├── lib/
│   ├── main.dart                    # Point d'entrée de l'application
│   ├── pages/
│   │   └── home_page.dart          # Page d'accueil
│   ├── services/
│   │   ├── ai_service.dart         # Service IA (LLM)
│   │   └── document_service.dart   # Service de gestion des documents
│   ├── models/
│   │   └── document_model.dart     # Modèle Hive pour les documents
│   └── widgets/
│       ├── document_upload_widget.dart      # Widget d'upload
│       └── generation_controls_widget.dart  # Widget de génération
├── android/                         # Code natif Android
├── ios/                             # Code natif iOS
├── web/                             # Code web
└── assets/                          # Ressources (modèles IA, icônes)
```

## Installation 🚀

### Prérequis
- Flutter 3.3.0 ou supérieur
- Dart 3.0.0 ou supérieur
- Git

### Étapes

1. **Cloner le repository**
```bash
git clone https://github.com/kennethafantsawo/Elearn.git
cd Elearn
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Générer les fichiers Hive** (pour la persistance de données)
```bash
flutter pub run build_runner build
```

4. **Lancer l'application**
```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# Web
flutter run -d web
```

## Configuration ⚙️

### Variables d'environnement
- `FLUTTER_SDK` : Chemin vers le SDK Flutter
- `ANDROID_SDK_ROOT` : Chemin vers le SDK Android (pour Android)

### Paramètres Android
- `compileSdkVersion: 34`
- `minSdkVersion: 21`
- `targetSdkVersion: 34`

### Paramètres iOS
- `Deployment Target: 12.0`
- Support iPhone et iPad

## Dépendances principales 📦

- `flutter` - Framework mobile
- `hive` - Base de données locale
- `llama_dart` - Intégration avec LLMs (Llama, Phi-3, etc.)
- `pdfx` - Lecture PDF
- `docx_to_text` - Lecture DOCX
- `file_picker` - Sélection de fichiers
- `path_provider` - Gestion des chemins
- `crypto` - Hashing SHA-256
- `bm25` - Search relevance ranking
- `flutter_lints` - Linting

## Développement 🔧

### Ajouter une dépendance
```bash
flutter pub add <package_name>
```

### Tests
```bash
flutter test
```

### Build pour production
```bash
# Android
flutter build apk
flutter build appbundle

# iOS
flutter build ios

# Web
flutter build web
```

## Documentation 📚

Pour plus d'informations, consultez :
- [Documentation Flutter](https://flutter.dev/docs)
- [Package Hive](https://pub.dev/packages/hive)
- [Package Llama Dart](https://pub.dev/packages/llama_dart)

## Contribution 🤝

Les contributions sont les bienvenues ! Veuillez :
1. Fork le repository
2. Créer une branche (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## Licence 📄

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.

## Contributeurs 👥

- **Kenneth Afantsawo** - Créateur du projet

## Support 💬

Pour des questions ou des support, ouvrez une issue sur [GitHub Issues](https://github.com/kennethafantsawo/Elearn/issues)

---

Construit avec ❤️ par Kenneth Afantsawo