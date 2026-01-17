# Movigo 🎬
[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)](https://firebase.google.com/)
[![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)](https://www.mongodb.com/)

**Movigo** is a sophisticated movie recommendation engine and discovery platform built with Flutter. It provides users with a seamless way to explore movies, track their watchlist, and receive personalized recommendations based on their tastes.

---

## 🚀 Features

- **Personalized Recommendations**: Intelligent movie suggestions based on user ratings and reviews.
- **Dynamic Movie Discovery**: Explore trending, popular, and top-rated movies with an elegant UI.
- **Comprehensive Movie Details**: Get deep insights into cast, crew, and user reviews.
- **Smart Search**: Find any movie instantly with our robust search functionality.
- **User Watchlists & History**: Keep track of movies you want to see and those you've already watched.
- **Robust Authentication**: Secure login options including Email/Password and Google Sign-In.
- **Interactive UI/UX**: Features glassmorphism, smooth animations, and a rich dark mode experience.
- **Real-time Synchronization**: Powered by Firebase and MongoDB for a responsive experience.

---

## 🛠️ Tech Stack

### Frontend
- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **UI Components**: 
  - `carousel_slider` for dynamic carousels.
  - `font_awesome_flutter` for rich iconography.
  - `google_fonts` for premium typography.
  - `sliding_up_panel` & `like_button` for interactive elements.

### Backend & Database
- **Authentication**: [Firebase Auth](https://firebase.google.com/products/auth)
- **Database**: [Cloud Firestore](https://firebase.google.com/products/firestore) & [MongoDB](https://www.mongodb.com/)
- **Analytics**: [Smartlook](https://www.smartlook.com/) for user experience tracking.

---

## 📱 Getting Started

### Prerequisites
- **Flutter SDK**: Ensure you have Flutter installed. [Installation Guide](https://docs.flutter.dev/get-started/install)
- **Firebase Project**: Setup a Firebase project and add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).

### Installation
1.  **Clone the repository**:
    ```bash
    git clone https://github.com/namanviber/Movigo.git
    cd Movigo
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the application**:
    ```bash
    flutter run
    ```

---

## 🏗️ Project Architecture

```text
lib/
├── main.dart                 # Application entry point
├── models/                   # Data models for JSON serialization
│   ├── DiscoverMovieModel.dart
│   ├── MovieCastDetailsModel.dart
│   ├── MovieCrewDetailsModel.dart
│   └── ...
├── screens/                  # Application screens and flows
│   ├── authorization/        # Login and registration modules
│   ├── home/                 # Main discovery and search views
│   └── settings/             # User profile and configurations
├── service/                  # Backend service integration
│   ├── apiCall.dart          # REST API orchestration
│   └── mongoDbCall.dart      # Database operations
├── utilities/                # Helper classes and themes
└── widgets/                  # Reusable UI components
    ├── movieList.dart        # Custom list view builders
    ├── movie_card.dart       # Atomic UI cards
    └── ...
```

---

## 🎥 Demo & App

| Resource | Link |
| :--- | :--- |
| **Demo Video** | [Watch Preview](https://bit.ly/43cnVQL) |
| **Download APK** | [Get Movigo for Android](https://drive.usercontent.google.com/download?id=1N8ScqeEPH6FcHi4c1NPoXRJmWJ-DM8QH&export=download) |

---

## 🤝 Collaborators

Movigo was engineered by a team of dedicated developers:

| Name | GitHub Profile |
| :--- | :--- |
| **Naman Jain** | [@namanviber](https://www.github.com/namanviber) |
| **Dhaval Pathak** | [@Dhaval-pathak](https://github.com/Dhaval-pathak) |
| **Aryaman Sital** | [@Aryamansital](https://github.com/Aryamansital) |
| **Sidharth Aggarwal** | [@sidharth-aggarwal](https://github.com/sidharth-aggarwal) |
| **Naman Khandelwal** | [@Naman3007](https://github.com/Naman3007) |
| **Priyansh Tyagi** | [@tyagipriyansh07](https://github.com/tyagipriyansh07) |
| **Soum Nag** | [@soumvaar](https://github.com/soumvaar) |

---

## ⚠️ Important Note
> [!NOTE]
> The Machine Learning Recommendation Model is currently not hosted on the web. As a result, certain recommendation features in the installed APK/built version may behave as a fallback until the model endpoint is restored.

---

## 📄 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details (if applicable).

---

**Movigo** — *Engineering the future of cinematic discovery.*
