# Weather App

This Flutter-based **Weather App** provides users with current weather conditions and hourly forecasts utilizing the **OpenWeatherMap API**. The app features a user friendly interface, enabling users to easily access weather data for various locations.

## Features

- **Current Weather**: Shows the current temperature and weather conditions with icons.
- **Hourly Forecast**: Provides the next 24 hours of weather data in a scrollable list.
- **Additional Information**: Displays humidity, wind speed, and pressure.
- **API Integration**: Fetches real-time weather data from OpenWeatherMap.
- **Error Handling**: Provides clear feedback for failed API requests.
- **Refresh and City Change**: Users can refresh the weather or switch cities.


## Screenshots
<img src="https://github.com/hassaanmustafavi/Flutter-Weather-App/blob/main/lib/ScreenShots/Loading.jpg" width="225" height="500"/>  <img src="https://github.com/hassaanmustafavi/Flutter-Weather-App/blob/main/lib/ScreenShots/loc1.jpg" width="225" height="500"/> <img src="https://github.com/hassaanmustafavi/Flutter-Weather-App/blob/main/lib/ScreenShots/loc2.jpg" width="225" height="500"/>

## Getting Started

### Prerequisites

- Flutter SDK (>= 2.10.0)
- Android Studio / Xcode for running the app on an emulator or physical device
- A free API key from [OpenWeatherMap](https://openweathermap.org/api)

### Installation

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/weather-app.git
    ```

2. Navigate into the project directory:

    ```bash
    cd weather-app
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Add your **OpenWeatherMap** API key in the `secrets.dart` file:

    ```dart
    const weatherApiKey = 'YOUR_API_KEY'; // Replace with your actual API key
    ```

5. Run the app on your emulator or physical device:

    ```bash
    flutter run
    ```

### Folder Structure
<img src="https://github.com/hassaanmustafavi/Flutter-Weather-App/blob/main/lib/ScreenShots/Folder_Structure.png" width="260" height="240"/>

### How It Works

1. **Weather Screen**:
   - `weather_screen.dart` is the main screen that displays the current weather and hourly forecast. It fetches data from the OpenWeatherMap API and updates the UI accordingly.

2. **Hourly Forecast**:
   - The hourly forecast is displayed using a dynamic list view, allowing users to view temperature changes every 3 hours.

3. **Additional Information**:
   - Additional weather details such as humidity, wind speed, and pressure are presented in an easily accessible format, enhancing the user's understanding of weather conditions.

### Dependencies

This app uses the following dependencies:

- [http](https://pub.dev/packages/http) - To handle API requests
- [flutter](https://flutter.dev/) - For building the app UI
- [Intl](https://pub.dev/packages/intl) - for Date and Time Formating

### API Integration

The app integrates with the **OpenWeatherMap API** to fetch real-time weather data. Ensure you replace the placeholder `YOUR_API_KEY` in the `secrets.dart` file with your actual API key.

### Error Handling

The app is equipped with error handling mechanisms for failed API requests, providing users with appropriate feedback in case of connectivity issues.

## License

This project is licensed under the MIT License and is free to use.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/awesome-feature`)
3. Commit your changes (`git commit -m 'Add some awesome feature'`)
4. Push to the branch (`git push origin feature/awesome-feature`)
5. Open a pull request

## Acknowledgments

- Special thanks to the OpenWeatherMap team for providing the weather API.
- Thanks to the Flutter community for their resources and support.
