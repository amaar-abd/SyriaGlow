# <img src="assets/images/syriaflagg.jpg" width="35" valign="middle"> Syria Glow - Syrian Tourism App

Syria Glow is a modern, bilingual (Arabic & English) tourism app built with Flutter using Clean Architecture. It features interactive Google Maps navigation, real-time weather, currency tools, and push notifications to provide an all-in-one guide for exploring Syria.

---

## 📸 App Screenshots

### 🏁 Startup & Onboarding
<p align="center">
  <img src="screenshots/splah.jpg" width="31%">
  <img src="screenshots/onboarding1_ar.jpg" width="31%">
  <img src="screenshots/onboarding1_en.jpg" width="31%">
  <img src="screenshots/onboarding2_ar.jpg" width="31%">
  <img src="screenshots/onboarding2_en.jpg" width="31%">
</p>

### 🔐 Authentication & Security
<p align="center">
  <img src="screenshots/login_ar.jpg" width="24%">
  <img src="screenshots/login_en.jpg" width="24%">
  <img src="screenshots/signup_ar.jpg" width="24%">
  <img src="screenshots/signup_en.jpg" width="24%">
</p>
<p align="center">
  <img src="screenshots/forgot_password_ar.jpg" width="24%">
  <img src="screenshots/forgot_password_en.jpg" width="24%">
  <img src="screenshots/otp_verification_ar.jpg" width="24%">
  <img src="screenshots/otp_verification_en.jpg" width="24%">
</p>
<p align="center">
  <img src="screenshots/reset_password_ar.jpg" width="24%">
  <img src="screenshots/reset_password_en.jpg" width="24%">
  <img src="screenshots/reset_password_success_ar.jpg" width="24%">
  <img src="screenshots/reset_password_success_en.jpg" width="24%">
</p>

### 🏠 Main Flow (Home ➔ Details ➔ Map)
<p align="center">
  <img src="screenshots/home_loading.jpg" width="24%">
  <img src="screenshots/home_ar.jpg" width="24%">
  <img src="screenshots/home_en.jpg" width="24%">
  <img src="screenshots/category_ar.jpg" width="24%">
  <img src="screenshots/category_en.jpg" width="24%">
  <img src="screenshots/details_ar.jpg" width="24%">
  <img src="screenshots/details_en.jpg" width="24%">
  <img src="screenshots/map_view.jpg" width="24%">
</p>

### 🔔 Notifications Center
<p align="center">
  <img src="screenshots/notifications_empty_ar.jpg" width="24%">
  <img src="screenshots/notifications_empty_en.jpg" width="24%">
  <img src="screenshots/home_with_alert.jpg" width="24%">
  <img src="screenshots/home_with_alert2.jpg" width="24%">
  <img src="screenshots/notifications_list_ar.jpg" width="24%">
</p>

### 🔍 Explore & Search Feature
<p align="center">
  <img src="screenshots/explore_ar.jpg" width="24%">
  <img src="screenshots/explore_en.jpg" width="24%">
  <img src="screenshots/search_results_ar.jpg" width="24%">
  <img src="screenshots/search_results_en.jpg" width="24%">
</p>



### 🛠 Services Feature (Emergency, Weather & Currency)
<p align="center">
  <img src="screenshots/services_ar.jpg" width="24%">
  <img src="screenshots/services_en.jpg" width="24%">
</p>
<p align="center">
  <img src="screenshots/emergency_numbers_ar.jpg" width="24%">
  <img src="screenshots/emergency_numbers_en.jpg" width="24%">
  <img src="screenshots/weather_ar.jpg" width="24%">
  <img src="screenshots/weather_en.jpg" width="24%">
</p>
<p align="center">
  <img src="screenshots/currency_converter_ar.jpg" width="24%">
  <img src="screenshots/currency_converter_en.jpg" width="24%">
</p>

### 👤 Profile & User Settings
<p align="center">
  <img src="screenshots/profile_ar.jpg" width="24%">
  <img src="screenshots/profile_en.jpg" width="24%">
  <img src="screenshots/profile_select_photo_ar.jpg" width="24%">
  <img src="screenshots/profile_select_photo_en.jpg" width="24%">
</p>
<p align="center">
  <img src="screenshots/favorites_ar.jpg" width="24%">
  <img src="screenshots/favorites_en.jpg" width="24%">
  <img src="screenshots/logout_dialog_ar.jpg" width="24%">
  <img src="screenshots/logout_dialog_en.jpg" width="24%">
</p>

---

## 🛠 Technical Implementation

This app demonstrates enterprise-level Flutter architecture, secure authentication, and seamless third-party service integration:

* **Architecture:** Adheres strictly to **Clean Architecture** (Data, Domain, Presentation) paired with **Clean Code** principles to guarantee loose coupling, high testability, and scalability.
* **State Management:** Powered by **Cubit (Bloc)** for predictable state transitions and distinct separation of business logic from the UI.
* **Dependency Injection:** Utilizes **GetIt** for clean service location, inversion of control, and efficient dependency management.
* **Responsive UI:** Built using `flutter_screenutil` to deliver a pixel-perfect, fully responsive user experience across diverse screen sizes and resolutions.
* **Localization:** Native **Bilingual Support (Arabic & English)** featuring dynamic RTL/LTR layout switching for seamless language transition.
* **REST APIs & Backend:**
  * **Custom Auth & Core Data REST API:** Primary backend integration handling authentication (register, login, logout) and managing core app data. Features full JSON-to-Model deserialization and mapping for profile updates, content fetching, and user data presentation.
  * **Weather API:** External REST API integration fetching live weather conditions and forecasts tailored to Syrian cities.
* **Maps, Navigation & Location Services:**
  * **Google Maps SDK:** Interactive embedded map rendering.
  * **Route Drawing & ETA:** Advanced polyline route calculation, dynamic distance measurement, and estimated travel time computation between user location and destinations.
  * **Geolocation & Geocoding:** Powered by `geolocator` and `geocoding` for exact GPS coordinate detection and address decoding.
* **Push Notifications (FCM):** Real-time engagement managed via **Firebase Cloud Messaging (FCM)** integrated with `flutter_local_notifications` for foreground push notifications.
* **Secure Token Storage:** Encrypted sensitive authentication tokens stored locally using `flutter_secure_storage`.

---

## 🏗 Project Structure & Architecture

### 1. Presentation Layer
* **UI & Screens:** Fully responsive layouts, custom design systems, and bilingual support.
* **Cubit Management:** Handles user interactions, API states, dynamic localization, and screen flow.

### 2. Domain Layer
* **Use Cases:** Encapsulates business operations .
* **Repositories (Contracts):** Defines strict abstract interfaces for data operations.

### 3. Data Layer
* **Models:** Data transfer objects (DTOs) mapped from REST APIs and Firestore payloads.
* **Data Sources:** Abstracted Remote Data Sources handling network calls (Custom Backend REST APIs, Weather API, FCM) and Local Data Sources (`FlutterSecureStorage`).
* **Repositories (Implementations):** Implements domain interfaces, coordinating network requests and secure storage cache.

---

## 🚀 Key Features

* **Bilingual Experience:** Complete support for both Arabic and English with seamless RTL/LTR adjustments.
* **Secure Account Operations:** Full registration flow including Email verification (OTP), password reset, and encrypted token-based sessions.
* **Interactive Navigation & Map:** Discover tourist attractions on the map, draw optimal routes from current location, and view real-time distance and estimated arrival time.
* **Live Weather Companion:** Check up-to-date city weather forecasts before planning outdoor trips.
* **Smart Search & Categories:** Browse landmark categories, filter places, and explore curated services easily.
* **Essential Tourist Tools:** Quick access to currency conversion utilities and local emergency contact numbers.
* **Push Notifications:** Instant alerts and broadcast updates delivered via (FCM).
* **Favorites & Customization:** Bookmark favorite spots and update user profile details on the fly.

---
*Developed with ❤️ by **Amaar Abd Alrahman***
