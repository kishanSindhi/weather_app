import 'package:flutter/material.dart';
import 'package:weather_app/screens/loacation_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utils/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key, required this.decodedData}) : super(key: key);
  final dynamic decodedData;

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late double temperature;
  late String cityName;
  late String icon;
  late String message;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.decodedData);
  }

  void updateUI(dynamic decodedData) {
    setState(() {
      if (decodedData == null) {
        temperature = 0;
        cityName = "";
        message = "Something went wrong";
        icon = ":(";
        return;
      }
      temperature = decodedData['main']['temp'];
      cityName = decodedData['name'];
      var condition = decodedData['weather'][0]['id'];
      message = weatherModel.getMessage(temperature.round());
      icon = weatherModel.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          var decodedData =
                              await weatherModel.getLocationWeather();
                          updateUI(decodedData);
                        },
                        icon: const Icon(
                          Icons.pin_drop,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          var typedName = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LocationScreen(),
                            ),
                          );
                          if (typedName != null && typedName != " ") {
                            var weatherFromSearch = await weatherModel
                                .getWeatherFromLocation(typedName);
                            updateUI(weatherFromSearch);
                          }
                        },
                        icon: const Icon(
                          Icons.location_city,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Text(
                        '${temperature.round()}°C ',
                        style: kTemperatureTextStyle,
                      ),
                      Text(
                        icon,
                        style: kMessageStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$message in $cityName!",
                    textAlign: TextAlign.right,
                    style: kMessageStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
