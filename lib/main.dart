import 'package:flutter/material.dart';
import 'Screens/input_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        body: const InputPage(),
      ),
    );
  }
}
