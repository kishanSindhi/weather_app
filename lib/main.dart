import 'package:flutter/material.dart';

import 'screens/loading_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: const LoadingScreen(),
      theme: ThemeData.dark(),
    ),
  );
}
