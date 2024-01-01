import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_1/model/onBoardingModel.dart';

import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> onBoardingList = [
    BoardingModel(
        image: 'assets/images/illustration1.svg',
        title: 'You Package in Our Safe Hands'),
    BoardingModel(
        image: 'assets/images/illustration 2.svg',
        title: 'Committed Delivery on Time'),
    BoardingModel(
        image: 'assets/images/illustration.svg',
        title: 'Fastest & Safest Delivery'),
    BoardingModel(
        image: 'assets/images/Group 3.svg',
        title: 'Browse & Order All Products at Any Time'),
  ];
  bool isLastImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: boardController,
                children: onBoardingList
                    .map(
                      (e) => Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SvgPicture.asset(e.image),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )
                    .toList(),
                onPageChanged: (int index) {
                  if (index == onBoardingList.length - 1) {
                    setState(() {
                      isLastImage = true;
                    });
                  } else {
                    setState(() {
                      isLastImage = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: onBoardingList.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 12,
                    dotWidth: 12,
                    expansionFactor: 3.5,
                    spacing: 8,
                    activeDotColor: Colors.orange,
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen())),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        )),
                    const Spacer(),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                          fixedSize:
                              MaterialStateProperty.all(const Size(100, 45)),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          isLastImage
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()))
                              : boardController.nextPage(
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.bounceInOut,
                                );
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
