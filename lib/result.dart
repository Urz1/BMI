import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  runApp(const Result());
}

class Result extends StatelessWidget {
  const Result({super.key});

  // const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("YOUR RESULT"),
          backgroundColor: DeactiveColor,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ActiveColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // height: double.,
                  margin: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Normal",
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        double.parse(BMI.toStringAsFixed(1)).toString(),
                        // message,
                        style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        message,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 80,
                  color: const Color.fromARGB(255, 250, 0, 117),
                  child: const Center(
                      child: Text(
                    "RECALCULATE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )),
                ),
              )
            ]));
  }
}
