import 'package:flutter/material.dart';
import 'package:says_app/presentation/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Says App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
