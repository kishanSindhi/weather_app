import 'package:flutter/material.dart';

const TextStyle kButtonTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

const TextStyle kDateStyle = TextStyle(fontSize: 20);

const TextStyle kCityStyle = TextStyle(
  fontSize: 50,
);

const TextStyle kTemperatureTextStyle = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 100,
);

const TextStyle kConditionCity = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 100,
);

const TextStyle kMessageStyle = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.w400,
);

const InputDecoration kTextInputFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter city name",
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
