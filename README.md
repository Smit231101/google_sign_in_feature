# 🔐 Flutter Clean Architecture - Firebase Google Authentication

A production-ready Flutter authentication module implementing **Google Sign-In with Firebase** using **Clean Architecture** and **Provider** for state management.

---

## 🚀 Features

* ✅ Google Sign-In using Firebase Authentication
* ✅ Clean Architecture (Data, Domain, Presentation layers)
* ✅ Scalable and testable code structure
* ✅ Provider-based state management
* ✅ Auto-login with Firebase session persistence
* ✅ Logout functionality
* ✅ Separation of concerns (UI ≠ Business Logic ≠ Data)

---

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles:

```
lib/
│
├── core/
│   ├── error/
│   └── usecase/
│
├── features/
│   └── auth/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── provider/
│           └── screens/
```

---

## 🧠 Tech Stack

* **Flutter**
* **Firebase Authentication**
* **Google Sign-In**
* **Provider (State Management)**

---

## 🔥 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/flutter-clean-auth.git
cd flutter-clean-auth
```

---

### 2. Setup Firebase

1. Go to Firebase Console
2. Create a new project
3. Add Android/iOS app
4. Download config file:

   * Android → `google-services.json`
   * iOS → `GoogleService-Info.plist`
5. Enable:

   * Authentication → Sign-in method → **Google**

---

### 3. Install Dependencies

```bash
flutter pub get
```

---

### 4. Run the App

```bash
flutter run
```

---

## 🔄 Authentication Flow

1. User taps **Login with Google**
2. Google account picker opens
3. User selects account
4. Firebase authenticates using Google credentials
5. User session is maintained automatically
6. App navigates to Home Screen

---

## 📱 Screens

* Login Screen
* Home Screen (Displays user name & email)

---

## 🧪 Future Improvements

* 🔐 Secure token storage (Keychain / Keystore)
* 🌐 Multi-provider authentication (Email, Apple, etc.)
* 🧩 Dependency Injection using GetIt
* 🛑 Error handling layer (Failure / Exceptions)
* 🧪 Unit & Integration testing

---

## ⚠️ Important Notes

* Firebase configuration is required before running the app
* Do not commit `google-services.json` in public repositories

---

## 🤝 Contributing

Contributions are welcome!
Feel free to fork the repo and submit a pull request.

---

## 📄 License

This project is open-source and available under the MIT License.
