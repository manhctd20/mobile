import 'package:flutter/material.dart';

import 'widgets/sellpage.dart';
import 'widgets/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Cool App",
      initialRoute: "/",
      routes: {
        "/": (ctx) => HomeScreen(),
        "/second": (ctx) => SecondScreen(),
      },
    );
  }
}