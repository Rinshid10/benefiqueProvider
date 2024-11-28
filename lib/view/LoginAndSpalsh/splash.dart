import 'dart:async';
import 'package:benefique/constants/image_constant.dart';
import 'package:benefique/view/LoginAndSpalsh/getStart.dart';
import 'package:benefique/view/bottomNavigation/bt.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: const [
            Image(image: AssetImage(ImageConstant.splasheImage)),
            Positioned(
              bottom: 20,
              child: Image(
                image: AssetImage('asset/loading.gif'),
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedin = prefs.getBool("isLogined") ?? false;
    if (isLoggedin) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (ctx) => Navigationpage()),
      );
    } else {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (ctx) => const Getstart()),
      );
    }
  }
}
