import 'package:flutter/material.dart';
import 'CoinScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF00796B),
        accentColor: const Color(0xFFFFC107),
      ),
      home: CoinScreen(),
    );
  }
}

// https://rest.coinapi.io/v1/exchangerate/ETH/USD?apikey=129B5B24-272D-4F27-8888-8E49A49727CD
