import 'dart:async';

import 'package:flutter/material.dart';

class SliderBy extends StatefulWidget {
  const SliderBy({Key? key}) : super(key: key);

  @override
  State<SliderBy> createState() => _SliderByState();
}

class _SliderByState extends State<SliderBy> {
  late final PageController pageController;

  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                pageNo = index;
                setState(() {});
              },
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (ctx, child) {
                    return child!;
                  },
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Hello you tapped at ${index + 1} "),
                        ),
                      );
                    },
                    onPanDown: (d) {
                      carasouelTmer?.cancel();
                      carasouelTmer = null;
                    },
                    onPanCancel: () {
                      carasouelTmer = getTimer();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 3, right: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey),
                      child: Center(child: Text('place image here')),
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: List.generate(
          //     5,
          //     (index) => GestureDetector(
          //       child: Container(
          //         margin: const EdgeInsets.all(2.0),
          //         child: Icon(
          //           Icons.circle,
          //           size: 9.0,
          //           color: pageNo == index
          //               ? Colors.indigoAccent
          //               : Colors.grey.shade300,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
