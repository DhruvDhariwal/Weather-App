import 'package:flutter/material.dart';
import 'package:weather_app/additional_information_card.dart';
import 'package:weather_app/api_key.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:weather_app/week_forecast_card.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherForecastHomePage extends StatefulWidget {
  const WeatherForecastHomePage({super.key});

  @override
  State<WeatherForecastHomePage> createState() => _WeatherForecastHomePageState();
}

class _WeatherForecastHomePageState extends State<WeatherForecastHomePage> {
  late Future weather;
  final String cityName = 'Bangalore';

  Future getWeather() async {
    try {
      final res = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey',),);

      final data = jsonDecode(res.body);

      if(data['cod']!='200') {
        throw data['message'];
      }
      return data;
    } catch(e){
      throw(e).toString();
    }

  }

  String getDayOfWeek(String dateString) {
    DateTime date = DateTime.parse(dateString); // Parse the API date string
    String dayOfWeek = DateFormat('EEE').format(date); // Format to "Tue"
    return dayOfWeek;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weather = getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
        ),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              weather = getWeather();
            });
          },
              icon: const Icon(Icons.refresh),
              iconSize: 25,
          )
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if(snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final data = snapshot.data!;

          final currentWeather = data['list'][0];

          final currentTemp = currentWeather['main']['temp'] - 273.15;
          final currentCondition = currentWeather['weather'][0]['main'];
          final currentPressure = currentWeather['main']['pressure'];
          final currentHumidity = currentWeather['main']['humidity'];
          final currentWindSpeed = currentWeather['wind']['speed'];

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Card
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: 10,),
                            Text('${double.parse(currentTemp.toString()).round()}°C',
                            style: const TextStyle(fontSize: 32,
                            fontWeight: FontWeight.bold
                            ),
                            ),
                            const SizedBox(height: 16,),
                            Icon(currentCondition == 'Clouds' ? Icons.cloud : currentCondition == "Rain" ? Icons.snowing : Icons.sunny,
                            size: 64,),

                            const SizedBox(height: 16,),
                            Text(currentCondition, style: const TextStyle(fontSize: 24,)),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Weather Forecast Cards
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Text("Week's Forecast",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(int i=7; i<=40; i+=8)
                      WeekForecastCard(
                          time: getDayOfWeek(data['list'][i]['dt_txt'].toString()),
                          icon: data['list'][i]['weather'][0]['main'] == 'Clouds' ? Icons.cloud : data['list'][i]['weather'][0]['main'] == "Rain" ? Icons.snowing : Icons.sunny,
                          temp: (double.parse((data['list'][i]['main']['temp']-273.15).toString()).round()).toString())
                  ],
                ),
              ),

              // More Information
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 10, bottom: 8),
                child: Text('Additional Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformationCard(icon: Icons.water_drop, stat: 'Humidity', value: '${currentHumidity.toString()} %'),
                AdditionalInformationCard(icon: Icons.air, stat: 'Wind Speed', value: '${currentWindSpeed.toString()} m/s'),
                AdditionalInformationCard(icon: Icons.compress, stat: 'Pressure', value: '${currentPressure.toString()} mb'),
              ],
            ),
            ],
          );
        }
      ),
    );
  }
}
