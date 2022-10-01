// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import "dart:async";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterDownApp(),
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({Key? key}) : super(key: key);

  @override
  State<CounterDownApp> createState() => _CounterDownApp();
}

class _CounterDownApp extends State<CounterDownApp> {
  changeEverySec() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  ///////////////////////////////////////////////////////dart
  int numberOfSeconds = 4;
  Timer? repeatedFunction;

  starTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (numberOfSeconds > 0) {
          numberOfSeconds--;
        } else {
          // numberOfSeconds = 0;
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            //  numberOfSeconds.toString().padLeft(2, "0"),
            (numberOfSeconds > 0)
                ? numberOfSeconds.toString().padLeft(2, "0")
                : "👍👍",
            style: (numberOfSeconds > 0)
                ? TextStyle(fontSize: 80, color: Colors.white)
                : TextStyle(fontSize: 44, color: Colors.white),
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "Second ",
            style: TextStyle(fontSize: 80, color: Colors.white),
          ),
          SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  starTimer();
                setState(() {
                    if (numberOfSeconds == 0) {
                    numberOfSeconds = 4;
                  }
                });
                },
                child: Text(
                  "Start Timer ",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                // change color of ElevatedButton
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[100],
                ),

                onPressed: () {
                  repeatedFunction!.cancel();
                },
                child: Text(
                  "Stop Timer ",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
