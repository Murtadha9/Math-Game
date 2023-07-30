import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mathgame/widgets/result_message.dart';

import 'widgets/number_pad.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hard = false;
  int A = 2;
  int B = 1;
  String userAnswer = '';
  var signOperator = '+';
  var randomNumber = Random();
  int score = 0;
  List<String> pads = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
    '+',
    '-',
    '*',
  ];

  void ButtonTap(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (button == '+') {
        signOperator = '+';
      } else if (button == '-') {
        signOperator = '-';
      } else if (button == '*') {
        signOperator = '*';
      } else if (userAnswer.length < 5) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    if (signOperator == '+') {
      if (A + B == int.parse(userAnswer)) {
        score += 1;
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                text: 'Correct',
                ontap: nextQuestion,
                icon: Icons.arrow_forward,
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                text: 'Sorry Try again1',
                ontap: back,
                icon: Icons.rotate_left,
              );
            });
      }
    } else if (signOperator == '-') {
      if ((A - B).abs() == int.parse(userAnswer)) {
        score += 1;
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                text: 'Correct',
                ontap: nextQuestion,
                icon: Icons.arrow_forward,
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                text: 'Sorry Try again1',
                ontap: back,
                icon: Icons.rotate_left,
              );
            });
      }
    } else if (signOperator == '*') {
      if (A * B == int.parse(userAnswer)) {
        score += 1;
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                text: 'Correct',
                ontap: nextQuestion,
                icon: Icons.arrow_forward,
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                text: 'Sorry Try again1',
                ontap: back,
                icon: Icons.rotate_left,
              );
            });
      }
    }
  }

  void back() {
    Navigator.of(context).pop();
  }

  void nextQuestion() {
    Navigator.of(context).pop();
    setState(() {
      userAnswer = '';
    });

    if (hard == false) {
      A = randomNumber.nextInt(10);
      B = randomNumber.nextInt(10);
    } else {
      A = randomNumber.nextInt(100);
      B = randomNumber.nextInt(100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
              height: 160,
              color: const Color.fromARGB(168, 38, 128, 202),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 170,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Center(
                        child: Text(
                      'Score :  ${score}',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 170,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Esay',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Switch(
                            value: hard,
                            onChanged: (val) {
                              setState(() {
                                hard = val;
                              });
                            }),
                        const Text('Hard',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  )
                ],
              )),
          //question
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(A.toString() + signOperator + B.toString() + '=',
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(userAnswer,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                  itemCount: pads.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return NumberPad(
                      onTap: () => ButtonTap(pads[index]),
                      child: pads[index],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
