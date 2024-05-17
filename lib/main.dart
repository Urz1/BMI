import 'package:flutter/material.dart';
import 'main_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 12, 0, 20),
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 0, 20),
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('BMI CALCULATOR'),
          ),
      body: const Center(
        child: Inputpage(),
      ),
    );
  }
}
