import 'package:calculadora_imc/pages/home.dart';
import 'package:flutter/material.dart';

class IMCApp extends StatelessWidget {
  const IMCApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
