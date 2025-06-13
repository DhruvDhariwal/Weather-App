# Weather App

[![C++](https://img.shields.io/badge/language-C++-blue.svg)](https://en.wikipedia.org/wiki/C%2B%2B)
[![CMake](https://img.shields.io/badge/build-CMake-brightgreen.svg)](https://cmake.org/)
[![Dart](https://img.shields.io/badge/language-Dart-0175C2.svg)](https://dart.dev/)
[![Swift](https://img.shields.io/badge/language-Swift-orange.svg)](https://swift.org/)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## 🌦️ Overview

Weather App is a cross-platform weather application that provides real-time weather information for any city worldwide. Built using a combination of C++, CMake, Dart, Swift, and C, it demonstrates best practices in modern software engineering, seamless integration across languages, and a visually appealing user interface.

## ✨ Features

- **Real-Time Weather Updates:** Fetches live weather data from reliable APIs.
- **Multi-Platform Support:** Works on desktop and mobile, leveraging C++ for core logic and Dart/Swift for UI.
- **Current, Hourly, and Weekly Forecasts:** See temperature, humidity, wind speed, and more.
- **Location Search:** Search weather by city name or use GPS to get local weather.
- **Beautiful UI:** Modern, intuitive, and responsive design.
- **Open Source:** Freely available for personal and educational use.

## 🚀 Getting Started

### Prerequisites

- [C++ Compiler](https://gcc.gnu.org/)
- [CMake](https://cmake.org/)
- [Dart SDK](https://dart.dev/get-dart)
- [Swift](https://swift.org/getting-started/)
- [API Key](https://openweathermap.org/api) from OpenWeatherMap or similar (set in configuration)

### Build & Run

#### 1. Clone the repository

```bash
git clone https://github.com/DhruvDhariwal/Weather-App.git
cd Weather-App
```

#### 2. Configure & Build (C++ Core)

```bash
mkdir build
cd build
cmake ..
make
```

#### 3. Run the Application

- **Desktop (C++):**
  ```bash
  ./weather_app
  ```

- **Mobile UI (Dart/Flutter):**
  ```bash
  cd mobile_ui
  flutter run
  ```

- **macOS/iOS (Swift):**
  Open the `WeatherApp.xcodeproj` in Xcode and run.

### Configuration

- Set your weather API key in `config/settings.json` or as an environment variable:
  ```bash
  export WEATHER_API_KEY=your_api_key_here
  ```

## 🛠️ Project Structure

```
Weather-App/
├── core/              # C++ core logic
├── CMakeLists.txt
├── mobile_ui/         # Dart/Flutter mobile frontend
├── ios/               # Swift iOS frontend
├── include/           # C++ headers
├── config/            # Configuration files
├── scripts/           # Build and automation scripts
└── README.md
```

## 📦 Dependencies

- **C++:** Boost, cURL
- **Dart:** Flutter, http, provider
- **Swift:** Alamofire, SwiftyJSON

Refer to each sub-project's README for detailed dependency installation.

## 🖼️ Screenshots

<!-- Add screenshots here -->
![Weather App Main Screen](assets/screenshots/main.png)
![Forecast View](assets/screenshots/forecast.png)

## 🧑‍💻 Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements or bug fixes.

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- [OpenWeatherMap](https://openweathermap.org/)
- [Flutter](https://flutter.dev/)
- [Swift](https://swift.org/)

---

*Made with ❤️ by [Dhruv Dhariwal](https://github.com/DhruvDhariwal)*
