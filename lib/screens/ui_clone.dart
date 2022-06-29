import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/constants.dart';

class UIClone extends StatefulWidget {
  const UIClone({Key? key}) : super(key: key);

  @override
  State<UIClone> createState() => _UICloneState();
}

class _UICloneState extends State<UIClone> {
  String now = DateFormat.yMMMEd().format(DateTime.now());
  final searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Search your city",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Petlad",
                style: kCityStyle,
              ),
              const SizedBox(height: 10),
              Text(
                now,
                style: kDateStyle,
              ),
              const SizedBox(height: 10),
              const Text(
                "37°",
                style: kTemperatureTextStyle,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                "Its to hot out there make sure to be hydrated",
                style: kMessageStyle,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.pin_drop),
      ),
    );
  }
}
