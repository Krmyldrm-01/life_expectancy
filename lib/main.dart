import 'package:flutter/material.dart';

import 'InputPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black54,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: "LuckiestGuy",
              fontSize: 20,
            )),
        scaffoldBackgroundColor: Colors.blueGrey,
        brightness: Brightness
            .dark, //text ile arka plan arasında oto. konstrat farkı yaratır
      ),
      home: InputPage(),
    );
  }
}
