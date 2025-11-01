# 💎 Glimmer - Bridal Jewelry Gallery App

A beautiful Flutter app showcasing a stunning catalog of bridal jewelry pieces in a clean, image-focused design. Built with Firebase Firestore for dynamic content management.

## 📱 Features

- **Image Gallery** - Browse beautiful jewelry collections in a grid layout
- **Categories** - Organized into Necklaces, Earrings, Bangles, and Bridal Sets
- **Favorites** - Save your favorite designs for quick access
- **Image Viewer** - Full-screen viewing with pinch-to-zoom
- **Download** - Save images directly to device gallery
- **Share** - Share image links with others
- **Dark Mode** - Toggle between light and dark themes
- **AdMob Ready** - Placeholder spots for banner and interstitial ads

## 🛠️ Tech Stack

- **Flutter** - Cross-platform mobile framework
- **Firebase Firestore** - Cloud database for jewelry items
- **Provider** - State management
- **Material 3** - Modern UI design
- **Google Fonts** - Custom typography

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^4.1.1
  cloud_firestore: ^6.0.2
  provider: ^6.0.0
  shared_preferences: ^2.0.0
  google_fonts: ^6.1.0
  dio: ^5.7.0
  gal: ^2.3.2
  path_provider: ^2.1.5
  permission_handler: ^11.3.1
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.6.0 or higher)
- Firebase account
- Android Studio / VS Code
- Android device or emulator

### Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/najmulmyself/bridal-jwellary.git
   cd glimmer
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Firebase Setup**

   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add an Android app to your Firebase project
   - Download `google-services.json` and place it in `android/app/`
   - Run FlutterFire CLI to configure:
     ```bash
     flutterfire configure
     ```

4. **Enable Firestore**

   - Go to Firebase Console → Firestore Database
   - Create database in production mode
   - See [FIRESTORE_SETUP.md](FIRESTORE_SETUP.md) for detailed instructions

5. **Run the app**
   ```bash
   flutter run
   ```

## 🗂️ Project Structure

```
lib/
├── config/              # App configuration (future)
├── models/              # Data models
│   └── jewelry_item.dart
├── pages/               # App screens
│   ├── home_page.dart
│   ├── categories_page.dart
│   ├── favorites_page.dart
│   ├── image_viewer_page.dart
│   ├── settings_page.dart
│   └── splash_page.dart
├── services/            # Business logic
│   └── firebase_storage_service.dart
├── state/               # State management
│   ├── app_settings.dart
│   └── gallery_state.dart
├── widgets/             # Reusable components
│   ├── app_logo.dart
│   ├── banner_ad_placeholder.dart
│   ├── image_grid_tile.dart
│   └── interstitial_ad_placeholder.dart
├── theme.dart           # App theming
└── main.dart           # Entry point
```

## 🔥 Firebase Firestore Structure

### Collection: `jewelry_items`

Each document contains:

```json
{
  "imageUrl": "https://example.com/image.jpg",
  "category": "Necklaces",
  "title": "Golden Bridal Necklace"
}
```

### Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /jewelry_items/{itemId} {
      allow read: if true;
      allow write: if false;
    }
  }
}
```

## 🎨 Making it a Template

This app is designed to be easily reusable for other gallery-based apps (mehendi designs, rangoli patterns, etc.). To adapt it:

1. Update `lib/config/app_config.dart` (future enhancement)
2. Change app name in `pubspec.yaml`
3. Update Firebase collection name
4. Modify categories in `GalleryState.categories`
5. Replace branding assets and colors in `theme.dart`

## 📱 AdMob Integration (Future)

Ad placeholders are already in place:

- **Banner Ads** - Bottom of home page, categories, etc.
- **Interstitial Ads** - Every 5 image swipes in viewer

To integrate:

1. Create AdMob account
2. Add `google_mobile_ads` package
3. Replace placeholder widgets with real AdMob widgets
4. Add your Ad Unit IDs

## 🔐 Security Notes

- Firebase API keys are safe to commit (they're identifier keys, not secret keys)
- Security is enforced through Firestore Rules
- Always restrict API keys in Google Cloud Console
- See `.gitignore` for files that should not be committed

## 🤝 Contributing

This is a personal project, but suggestions are welcome!

## 📄 License

This project is private and not licensed for public use.

## 👤 Author

**Najmul Myself**

- GitHub: [@najmulmyself](https://github.com/najmulmyself)
- Repository: [bridal-jwellary](https://github.com/najmulmyself/bridal-jwellary)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend infrastructure
- Unsplash for sample images
- Material Design 3 guidelines

---

Built with ❤️ using Flutter
