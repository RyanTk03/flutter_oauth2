# Flutter OAuth2 Frontend Setup Guide

## 📱 Overview

This is the frontend of an OAuth2-based authentication project. It is a Flutter application connected to a Node.js backend.

### 🔐 Pages

The app includes:

- **Login Page**: Authenticate an existing user
- **Register Page**: Create a new user account
- **Home Page**: Protected page only accessible to authenticated users

---

## 🛠️ Requirements

Before running this app, make sure you have:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- A working backend server (see [backend README](../backend/README.md))
- An emulator or a physical device

---

## ⚙️ Configuration

You need to modify several constants and files in the Flutter project to match your backend server and credentials.

### ✅ Steps

1. **Set the base URL of your backend server**

   Modify the file:

   ```dart
   // FILE: lib/helpers/constant.dart
   static const baseUrl = '<your_server_url>'
   ```

2. **Update token client and secret**

    ```dart
    // FILE: lib/services/auth_service.dart
    class AuthService {
      ...
      final String _client = '<YOUR_CLIENT_ID>';
      final String _secret = '<YOUR_CLIENT_SECRET>';
      ...
    }
    ```

> Make sure all constants match what you used during backend setup.

---

## 🚀 Running the App

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Launch the app on a simulator or connected device:

   ```bash
   flutter run
   ```

---

## 📌 Notes

- The app expects the backend to be reachable via the base URL set in your constants.
- The OAuth2 client credentials (`client` and `client`) must be the same as with those registered in the backend before using the app.
  See backend README for the request you must send via Postman or another API client.

---

## 📁 Directory Structure (Simplified)

```
lib/
├── helpers/
│   └── constant.dart         # Contains baseUrl
├── screens/
│   ├── login.dart
│   ├── register.dart
│   └── home.dart
├── services/
│   └── auth_service.dart          # Handles communication with the backend
└── main.dart
```
