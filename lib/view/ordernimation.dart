import 'dart:async';
import 'package:benefique/constants/image_constant.dart';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/view/bottomNavigation/bt.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderAnimation extends StatefulWidget {
  const OrderAnimation({super.key});

  @override
  State<OrderAnimation> createState() => _OrderAnimationState();
}

class _OrderAnimationState extends State<OrderAnimation> {
  bool showFirstIcon = true;
  bool showText = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        showFirstIcon = false;
      });

      Timer(Duration(seconds: 1), () {
        setState(() {
          showText = true;
        });
      });

      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => Navigationpage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: showFirstIcon
                    ? Column(
                        children: [
                          SizedBox(
                              height: 300,
                              child: Lottie.asset(ImageConstant.imageJso)),
                          textAoboshiOne2(
                              text: TextConstant.animationpageText,
                              fontSizes: 20,
                              colors: Colors.black,
                              fontw: FontWeight.bold)
                        ],
                      ) // First icon
                    : SizedBox(
                        height: 300,
                        child: Lottie.asset(ImageConstant.trueAnimation),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
