import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/hourly_focused_item.dart';
import 'package:weather_app/additional_information_item.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  late Future<Map<String,dynamic>> weather;
  Future<Map<String,dynamic>> getCurrentWeather() async
  {
    final String cityName = "Kathmandu";
    try {
      await dotenv.load(fileName: ".env");
      final String apiKey = (dotenv.env['OPENWEATHERAPIKEY'])!;
      http.Response response = await http.get(
          Uri.parse(
              "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey")
      );
      final data = jsonDecode(response.body);
      if(data['cod'] != '200')
        {
          throw "An Unexpected Error Occured!";
        }

      return data;

    }
    catch(e)
    {
      throw e.toString();
    }
  }

  @override
  void initState()
  {
    super.initState();
    weather = getCurrentWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                    weather = getCurrentWeather();
                });
              },
              icon: Icon(Icons.refresh)),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
            future: weather,
            builder: (context, asyncSnapshot) {
              if(asyncSnapshot.connectionState == ConnectionState.waiting)
                {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(
                    ),
                  );
                }
              else if(asyncSnapshot.hasError )
              {
                return Text(asyncSnapshot.error.toString());
              }

              final data = asyncSnapshot.data!;

              final currentWeatherData = data['list'][0];
              final currentTemp = currentWeatherData['main']['temp'];
              final currentSky = currentWeatherData['weather'][0]['main'];

              final currentHumidity = currentWeatherData['main']['humidity'];
              final currentWindSpeed = currentWeatherData['wind']['speed'];
              final currentPressure = currentWeatherData['main']['pressure'];


              return SingleChildScrollView(
              
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Main Card
                SizedBox(
                  width: double.infinity,
                  child: Card(
              
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16)
                    ),
              
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
              
                        child: Padding(
                              padding:  const EdgeInsets.all(16.0),
                              child: Padding(
                                padding:  const EdgeInsets.all(16.0),
                                child: Column(
              
                                  children: [
                                    Text("$currentTemp K",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32
                                    ),),
              
                                    const SizedBox(height: 16,),
                                    Icon(
                                      (currentSky =="Clouds"||currentSky=="Rain")
                                          ?Icons.cloud
                                          :Icons.sunny,
                                    size: 64,),
              
                                    const SizedBox(height: 16,),
                                    Text("$currentSky",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("Weather Forecast",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height: 10,),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          final hourlyForecast = data['list'][(index+1)];
                          final hourlyIcon = data['list'][(index+1)]['weather'][0]['main'];
                          final hourlyTime =hourlyForecast['dt_txt'].toString();
                          final hourlyTemp = hourlyForecast['main']['temp'].toString();

                          final time = DateTime.parse(hourlyTime);

                          return HourlyFocusedItem(
                            time: DateFormat(DateFormat.HOUR_MINUTE).format(time),
                            icon: (hourlyIcon =="Rain"|| hourlyIcon=="Clouds")? Icons.cloud : Icons.sunny,
                            temperature: hourlyTemp,
                          );
                        },
                    ),
                  ),
                    const SizedBox(height: 20,),
                    // Card For Additional Information part
                    const Text("Additional Information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Row
                        (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AdditionalInformationItem(title: "Humidity", value:(currentHumidity).toDouble(), icon:Icons.water_drop),
                          AdditionalInformationItem(title: "Wind Speed", value:(currentWindSpeed).toDouble(), icon:Icons.air),
                          AdditionalInformationItem(title: "Pressure", value:(currentPressure).toDouble(), icon:Icons.push_pin),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          ),
    );
  }
}
