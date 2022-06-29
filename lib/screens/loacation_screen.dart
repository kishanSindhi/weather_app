import 'package:flutter/material.dart';

import '../utils/constants.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/location_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 50,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Get Weather",
                  style: kButtonTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
