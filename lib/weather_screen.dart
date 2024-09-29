import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = 'Lahore';
  final TextEditingController textEditingController = TextEditingController();

  String toCelsius(temp){
    temp = temp-273.15;
    return temp.toStringAsFixed(1)+'°C';
  }
  Future<Map<String,dynamic>> getCurrentWeather() async{
    try {
      final res = await http.get(
        Uri.parse(
          'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$weatherApiKey'
        )
      );
      final data = jsonDecode(res.body);
      if (data['cod']!= '200') {
        throw 'An Unexpected Error Occur';
      }
      return data;

    } catch (e) {
      throw e.toString();
    }
  }
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold),
          ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                cityName='Lahore';
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot){
          if (snapshot.connectionState==ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()
              )
            );
          }
          final data = snapshot.data!;
          final currWeatherData = data['list'][0];
          
          final currTemp=toCelsius(currWeatherData['main']['temp']); 
          final currSky = currWeatherData['weather'][0]['main'];
          final currPressure = currWeatherData['main']['pressure'];
          final currWindSpeed = currWeatherData['wind']['speed'];
          final currHumidity = currWeatherData['main']['humidity'];
          textEditingController.text =cityName;
          
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicWidth(
                  child: TextField(
                    onSubmitted: (value) {
                      cityName = value;
                      setState(() {
                        getCurrentWeather();
                      });
                    },
                    controller: textEditingController,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.0,
                          style: BorderStyle.solid,
                          color: Colors.white70,
                          ),
                          borderRadius: BorderRadius.circular(180),
                      ),
                      prefixIcon: const Icon(Icons.location_on,size: 22,),
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2.0,
                        style: BorderStyle.solid,
                        color: Colors.white70,
                        ),
                        borderRadius: BorderRadius.circular(180),
                      ),
                      constraints: const BoxConstraints(maxHeight: 32),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12 ,vertical: 8)
                    ),
                  ),
                ),
                //main card
                const SizedBox(height: 12,),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                currTemp,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16,),
                              Icon(
                                currSky == 'Clouds' || currSky == 'Rain'?
                                Icons.cloud
                                :Icons.sunny,
                                size: 64,
                                color:currSky == 'Clouds' || currSky == 'Rain'? Colors.white:Colors.yellow
                              ),
                              Text(
                                currSky,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                //weather Forecast
                const Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      final hourlyForecast = data['list'][index+1];
                      final hourlySky = hourlyForecast['weather'][0]['main'];
                      final hourlyTemp = toCelsius(hourlyForecast['main']['temp']);
                      final time = DateTime.parse(hourlyForecast['dt_txt']);
                      return HourlyForecastItem(
                        time: DateFormat.j().format(time),
                        icon: 
                                hourlySky == 'Clouds' || hourlySky == 'Rain'?
                                Icons.cloud
                                :Icons.wb_sunny_rounded,
                        temperature: hourlyTemp
                      );
                    }
                  ),
                ),
                const SizedBox(height: 16,),
                //weather Forecast
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(icon: Icons.water_drop_rounded, label: 'Humidity', value: currHumidity.toString()),
                    AdditionalInfoItem(icon: Icons.air_rounded, label: 'Wind Speed', value: currWindSpeed.toString()),
                    AdditionalInfoItem(icon: Icons.beach_access_rounded, label: 'Pressure', value: currPressure.toString())
                  ],
              )
            ],
          ),
        );
      })
    );
  }
}