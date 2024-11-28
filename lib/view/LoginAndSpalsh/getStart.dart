import 'package:benefique/constants/image_constant.dart';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/utils/color_cosntants.dart';
import 'package:benefique/view/LoginAndSpalsh/loginFor.dart';
import 'package:benefique/view/LoginAndSpalsh/signUp.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Getstart extends StatefulWidget {
  const Getstart({super.key});

  @override
  State<Getstart> createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Image(
                    image:
                        AssetImage(ImageConstant.mainImageOFsplash)),
              ),
              Gap(20),
              Text(
                TextConstant.startJourny,
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                TextConstant.benifique,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
              Gap(15),
              Text(
                TextConstant.joinUs,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(TextConstant.yourPath,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Gap(30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: mainBlueColor),
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: ColorCosntants.whitecolor,
                      minimumSize: Size(200, 50)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (ctx) => Login()));
                  },
                  child: Text(TextConstant.login,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: mainBlueColor))),
              Gap(20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: mainBlueColor),
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: mainBlueColor,
                      minimumSize: Size(200, 50)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => SignUpPage()));
                  },
                  child: Text(TextConstant.signup,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: bagroundColorOFscreen)))
            ],
          ),
        ),
      ),
    );
  }
}
