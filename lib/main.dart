import 'package:flutter/material.dart';

import 'LoginScreens/starting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Pet Sale App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Starting_Screen (),
    );
  }
}

