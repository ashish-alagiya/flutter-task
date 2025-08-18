# Flutter Assignment App

A Flutter application demonstrating profile, campaign matching, and basic information screens with **GetX** state management, **Google Fonts**, and reusable components.

---

## 🚀 Getting Started

### 1. Installation
Clone the repository and install dependencies:
```bash
git clone https://ashish-alagiya@github.com/ashish-alagiya/flutter-task.git
cd flutter_assignment_app
flutter pub get

### To run on Android:
flutter run

### To run on iOS:
flutter run -d ios

## 📂 Project Structure

lib/
│── components/                     # Reusable widgets/components
│   ├── common_image_picker_widget.dart
│   ├── common_textfield.dart
│   ├── animation.dart
│   └── custom_snack_bar.dart
│
│── constants/                      # App-wide constants
│   ├── app_theme.dart
│   ├── assets.dart
│   ├── colors.dart
│   ├── dimens.dart
│   ├── text_style.dart
│   └── validations.dart
│
│── pages/                          # Feature-based structure (GetX pattern)
│   │
│   ├── basic_information/          # User basic info
│   │   ├── binding/binding.dart
│   │   └── presentation/
│   │       ├── controller/basic_information_controller.dart
│   │       └── views/basic_information_screen.dart
│   │
│   ├── campaign_matching/          # Campaign matching feature
│   │   ├── binding/binding.dart
│   │   └── presentation/
│   │       ├── controller/campaign_matching_controller.dart
│   │       └── views/
│   │           ├── campaign_matching_screen.dart
│   │           └── widgets/campaign_card.dart
│   │
│   ├── my_information/             # My information feature
│   │   ├── binding/binding.dart
│   │   └── presentation/
│   │       ├── controller/my_information_controller.dart
│   │       └── views/my_information_screen.dart
│   │
│   ├── profile/                    # Profile management
│   │   ├── binding/binding.dart
│   │   └── presentation/
│   │       ├── controller/profile_controller.dart
│   │       └── views/profile_screen.dart
│   │
│   ├── set_password/               # Password setup
│   │   ├── binding/binding.dart
│   │   └── presentation/
│   │       ├── controller/set_password_controller.dart
│   │       └── views/set_password_screen.dart
│   │
│   ├── splash/                     # Splash screen
│   │   ├── binding/binding.dart
│   │   └── presentation/
│   │       ├── controller/splash_controller.dart
│   │       └── views/splash_screen.dart
│
│── routes/                         # App navigation (GetX)
│   ├── app_pages.dart
│   └── app_routes.dart
│
│── service/                        # App-wide services
│   └── image_picker.dart
│
└── main.dart                       # App entry point
