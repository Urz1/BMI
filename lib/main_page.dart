
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result.dart';

const colr = Color(0XFF1D1E33);
const Color ActiveColor = Color.fromARGB(255, 10, 13, 48);
const Color DeactiveColor = Color(0XFF1D1E33);
int age = 1;
int Weight = 10;
bool flag = true;
double HEIGHT = 180.0;
double BMI = Weight / ((HEIGHT / 100) * (HEIGHT / 100));
String message = "";
void Message() {
  if (BMI >= 18 && BMI <= 25) {
    message = "You a normal body weight.\n Good Job!";
  } else {
    message = 'you need change. \n work hard!';
  }
}

class Inputpage extends StatefulWidget {
  const Inputpage({super.key});

  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Color MaleCardColor = DeactiveColor;
  Color FemaleCardColor = ActiveColor;

  void update(String type) {
    setState(
      () {
        if (type == 'AGE') {
          if (flag) {
            age = age + 1;
            print(age);
          } else if (age > 0) {
            age = age - 1;
          }
        } else if (type == 'WEIGHT') {
          if (flag) {
            Weight = Weight + 1;
          } else if (Weight > 0) {
            Weight = Weight - 1;
          }
        }
      },
    );
  }

  void UpdateColor(int num) {
    num == 1
        ? (MaleCardColor == DeactiveColor
            ? (MaleCardColor = ActiveColor, FemaleCardColor = DeactiveColor)
            : MaleCardColor = DeactiveColor)
        : (num == 2
            ? (FemaleCardColor == DeactiveColor
                ? (FemaleCardColor = ActiveColor, MaleCardColor = DeactiveColor)
                : FemaleCardColor = DeactiveColor)
            : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        UpdateColor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: MaleCardColor,
                      cardChild: const Iconwid(
                        icn: FontAwesomeIcons.mars,
                        txt: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        UpdateColor(2);
                      });
                    },
                    child: ReusableCard(
                        colour: FemaleCardColor,
                        cardChild: const Iconwid(
                          icn: FontAwesomeIcons.venus,
                          txt: "Female",
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: colr,
              cardChild: Center(
                child: Column(children: [
                  const Text(
                    "Height",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Ubuntu Sans Mono'),
                  ),
                  Text(
                    '${HEIGHT.toInt()}cm',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Ubuntu Sans Mono'),
                  ),
                  Slider.adaptive(
                    thumbColor: const Color.fromARGB(255, 255, 189, 211),
                    activeColor: const Color.fromARGB(255, 255, 255, 255),
                    value: HEIGHT,
                    onChanged: (newvalue) {
                      setState(() {
                        HEIGHT = newvalue;
                      });
                    },
                    min: 1,
                    max: 300,
                    label: "$HEIGHT",
                  )
                ]),
              ),
            ),
          ),
          Row(
            children: [
              ReusableCard2(
                txt: "WEIGHT",
                pressed: () => update("WEIGHT"),
                num: Weight,
              ),
              ReusableCard2(
                txt: "AGE",
                pressed: () => update("AGE"),
                num: age,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              BMI = Weight / ((HEIGHT / 100) * (HEIGHT / 100));
              Message();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Result(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              color: const Color.fromARGB(255, 250, 0, 117),
              child: const Center(
                  child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableCard2 extends StatelessWidget {
  ReusableCard2({super.key, 
    required this.txt,
    this.cardchild,
    required this.pressed,
    required this.num,
  });

  final String txt;
  final Object? cardchild;
  final VoidCallback pressed;
  int num;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ReusableCard(
              colour: colr,
              cardChild: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      txt,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 105, 105, 105),
                      ),
                    ),
                  ),
                  Text(
                    num.toString(),
                    style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.small(
                        shape: const CircleBorder(),
                        onPressed: () {
                          flag = true;
                          pressed();
                        },
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton.small(
                        shape: const CircleBorder(),
                        onPressed: () {
                          flag = false;
                          pressed();
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Iconwid extends StatelessWidget {
  const Iconwid({super.key, required this.txt, required this.icn});
  final String txt;
  final IconData icn;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icn,
        size: 60,
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        txt,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      )
    ]);
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colour, this.cardChild, this.slide});
  final Color colour;
  final Widget? cardChild;
  final Slider? slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.all(10),
      height: 165,
      child: cardChild,
    );
  }
}

// 0XFF1D1E33

