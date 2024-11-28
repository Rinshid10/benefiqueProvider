// ignore: file_names
import 'package:benefique/view/allprodectpage.dart';
import 'package:benefique/view/homePage.dart';
import 'package:benefique/view/pieChart.dart';
import 'package:benefique/view/profilPage.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class Navigationpage extends StatefulWidget {
  int curntBottomindex;
  Navigationpage({super.key, this.curntBottomindex = 0});

  @override
  State<Navigationpage> createState() => _NavigationpageState();
}

int currentState = 0;
var pages = [
  HomePage(),
  AllprodectPage(),
  Dashboard(),
  ProfileP(),
];

class _NavigationpageState extends State<Navigationpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentState = widget.curntBottomindex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentState],
      bottomNavigationBar: GNav(
          selectedIndex: currentState,
          curve: Curves.bounceIn,
          onTabChange: (value) {
            setState(() {
              currentState = value;
            });
          },
          color: Colors.black,
          backgroundColor: const Color.fromARGB(209, 247, 246, 246),
          activeColor: mainBlueColor,
          gap: 8,
          tabs: const [
            GButton(
              icon: (Iconsax.home),
              text: 'Home',
            ),
            GButton(
              icon: (Iconsax.shop),
              text: 'Prodects',
            ),
            GButton(
              icon: (Iconsax.presention_chart),
              text: 'Dashboard',
            ),
            GButton(
              icon: (Iconsax.user),
              text: 'Profile',
            ),
          ]),
    );
  }
}
