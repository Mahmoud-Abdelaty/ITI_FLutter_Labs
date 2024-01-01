import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftImageNumber = 1;
  int rightImageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Dice App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color(0xff018577),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                leftImageNumber = Random().nextInt(6) + 1;
              });
            },
            child: const Text(
              'ROLL ONE DICE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Shack to throw',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/$leftImageNumber.png',
                fit: BoxFit.fill,
                width: 125,
              ),
              Image.asset(
                'assets/images/$rightImageNumber.png',
                fit: BoxFit.fill,
                width: 125,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  leftImageNumber = Random().nextInt(6) + 1;
                  rightImageNumber = Random().nextInt(6) + 1;
                });
              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.grey[400],
                child: const Center(
                  child: Text(
                    'ROLL DICE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
