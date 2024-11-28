import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/profileFunctions.dart';
import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:benefique/utils/color_cosntants.dart';
import 'package:benefique/view/LoginAndSpalsh/loginFor.dart';
import 'package:benefique/view/bottomNavigation/bt.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernamForSignUp = TextEditingController();
  TextEditingController phoneNumberForSignUp = TextEditingController();
  TextEditingController passwordForSignUp = TextEditingController();

  Future<void> forSignUP() async {
    if (usernamForSignUp.text.isNotEmpty &&
        passwordForSignUp.text.isNotEmpty &&
        phoneNumberForSignUp.text.isNotEmpty) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('usernamForSignUp', usernamForSignUp.text);
      await pref.setString('passwordForSignUp', passwordForSignUp.text);
      await pref.setBool('isLogined', true);
      final usernameSave = usernamForSignUp.text;
      final paswordsave = passwordForSignUp.text;
      final numberSave = phoneNumberForSignUp.text;
      final save = ProfileOfbenifique(
          username: usernameSave,
          password: paswordsave,
          phonenumber: numberSave);
      Provider.of<profilefunction>(context, listen: false).addProfileData(save);
    
      // var box = Hive.box('userBox');
      // box.put('username', usernameSave);
      // box.put('phonenumber', numberSave);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) => Navigationpage()), (c) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: mainBlueColor,
          content: Text(TextConstant.filltheDetails)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bagroundColorOFscreen,
      ),
      backgroundColor: bagroundColorOFscreen,
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(100),
            Text(
              TextConstant.helloRegister,
              style: GoogleFonts.aoboshiOne(textStyle: TextStyle(fontSize: 30)),
            ),
            Text(
              'Started',
              style: GoogleFonts.aoboshiOne(textStyle: TextStyle(fontSize: 28)),
            ),
            Gap(50),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 40),
              child: Column(
                children: [
                  TextFormField(
                    controller: usernamForSignUp,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: TextConstant.hintTextUser,

                      // contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.person),
                    ),
                  ),
                  Gap(25),
                  TextFormField(
                    controller: phoneNumberForSignUp,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: TextConstant.hintTextPhone,

                      // contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.phone),
                    ),
                  ),
                  Gap(25),
                  TextFormField(
                    controller: passwordForSignUp,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: TextConstant.hintTextPassWord,

                      // contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Gap(20),
                      Text(
                        TextConstant.accountDId,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: mainBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                  Gap(30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 20,
                        backgroundColor: mainBlueColor,
                        minimumSize: Size(150, 50)),
                    onPressed: () {
                      forSignUP();
                    },
                    child: Text(
                      TextConstant.signup,
                      style: TextStyle(
                          color: ColorCosntants.whitecolor, fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
