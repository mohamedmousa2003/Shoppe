# e-commerce

## 📱 Project Overview
This Flutter application is an e-commerce–style mobile app built using **Clean Architecture**, **SOLID principles**, and **State Management** with dependency injection.
The app provides a smooth and structured user experience starting from authentication to browsing products fetched from a remote API.

---

## 🚀 App Flow

## 🤖 AI Virtual Try-On Feature

The application includes an **AI-powered virtual try-on feature** that allows users to preview clothing items on themselves before making a decision.

### How It Works:
- The user selects or uploads a **personal image**.
- The user chooses a **clothing item** (e.g., T-shirt).
- The AI processes both images and generates a **realistic preview** showing how the selected clothing looks on the user.
- The result is displayed directly inside the app.



### 🔹 Splash Screen
- Displays a splash screen on app launch.
- Checks if the user is already authenticated.
- If the user is logged in → navigates directly to **Home**.
- If not → navigates to the **Auth Selection Screen**.

---

### 🔐 Authentication
#### Auth Selection Screen
- Allows the user to choose between **Login** or **Register**.

#### Login Screen
- Email
- Password

#### Register Screen
- Name
- Email
- Password
- Confirm Password
- Phone Number

---

### 🏠 Home Screen
- Displays a list of **products fetched from a REST API**.
- Supports:
    - Product browsing
    - Category-based filtering
    - Search functionality

---

### 🔍 Search
- Enables searching products by name or category.

---

### 🗂 Categories
- Displays products grouped by categories.
- Allows users to browse products inside each category.

---

### ❤️ Favorites
- Users can add or remove products from their favorites list.
- Favorites are persisted locally.

---

### 👤 Profile
- Displays user profile information.
- Allows updating personal data such as:
    - Name
    - Email
    - Phone number

---

## 🧱 Architecture & Technologies

- **Clean Architecture**
    - Presentation Layer
    - Domain Layer
    - Data Layer
- **State Management:** BLoC / Cubit
- **Dependency Injection:** GetIt + Injectable
- **API Handling:** Dio
- **Local Storage:** Shared Preferences
- **Responsive UI:** Flutter ScreenUtil
- **Design Principles:** SOLID

---

## ✅ Key Features
- Authentication with login & registration
- Auto-login handling
- API-based product listing
- Search & category filtering
- Favorites management
- Profile editing
- Clean, scalable, and testable architecture




## 📦 Packages Used

### 🎨 UI & Design
- [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil)
- [`google_fonts`](https://pub.dev/packages/google_fonts)
- [`flutter_svg`](https://pub.dev/packages/flutter_svg)
- [`flutter_image_slideshow`](https://pub.dev/packages/flutter_image_slideshow)
- [`cached_network_image`](https://pub.dev/packages/cached_network_image)
- [`readmore`](https://pub.dev/packages/readmore)

### 🧠 State Management
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)
- [`equatable`](https://pub.dev/packages/equatable)

### 🌐 Network & Data
- [`dio`](https://pub.dev/packages/dio)
- [`shared_preferences`](https://pub.dev/packages/shared_preferences)
- [`dartz`](https://pub.dev/packages/dartz)
- [`connectivity_plus`](https://pub.dev/packages/connectivity_plus)

### 🛠 Utilities & Tools
- [`loader_overlay`](https://pub.dev/packages/loader_overlay)
- [`logger`](https://pub.dev/packages/logger)
- [`get_it`](https://pub.dev/packages/get_it)
- [`injectable`](https://pub.dev/packages/injectable)

### 🧪 Dev Dependencies
- [`build_runner`](https://pub.dev/packages/build_runner)
- [`injectable_generator`](https://pub.dev/packages/injectable_generator)

