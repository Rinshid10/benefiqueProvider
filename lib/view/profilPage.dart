import 'dart:io';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/dataClear.dart';
import 'package:benefique/view/editProfile.dart';
import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:benefique/view/LoginAndSpalsh/loginFor.dart';
import 'package:benefique/view/edityouMain.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer_typing_uninitialized_variables
var nameForProfile;

class ProfileP extends StatefulWidget {
  const ProfileP({super.key});

  @override
  State<ProfileP> createState() => _ProfilePState();
}

class _ProfilePState extends State<ProfileP> {
  late Box<ProfileOfbenifique> profileBox;
  bool isBoxOpened = false;

  @override
  void initState() {
    super.initState();
    _openProfileBox();
  }

  Future<void> _openProfileBox() async {
    profileBox = await Hive.openBox<ProfileOfbenifique>('saveData');
    setState(() {
      isBoxOpened = true;
    });
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLogined", false);

    Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (ctx) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          TextConstant.profle,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            if (isBoxOpened)
              ValueListenableBuilder(
                valueListenable: profileBox.listenable(),
                builder: (context, box, child) {
                  if (box.isEmpty) {
                    return Center(child: Text(TextConstant.noProfle));
                  }
                  final profile = box.values.first;
                  nameForProfile = profile.username;
                  return Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: mainBlueColor,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.white,
                              backgroundImage: profile.images != null
                                  ? FileImage(File(profile.images!))
                                  : null,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Text(
                          profile.username!,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          profile.phonenumber!,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            const Gap(25),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height < 350 ? 600 : 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(spreadRadius: 1, color: Colors.black)
                  ],
                  color: Color(0xfffbfbfb),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      const Gap(30),
                      buildListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditPagedForProfile(),
                            ),
                          );
                        },
                        leading: Iconsax.profile_circle5,
                        traill: Iconsax.arrow_right,
                        text: TextConstant.editProfile,
                      ),
                      const Gap(10),
                      buildListTile(
                        leading: Iconsax.heart5,
                        traill: Iconsax.arrow_right,
                        text: TextConstant.wishlist,
                      ),
                      const Gap(10),
                      buildListTile(
                        leading: Iconsax.edit,
                        traill: Iconsax.arrow_right,
                        text: TextConstant.editProdect,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const EditMain(),
                            ),
                          );
                        },
                      ),
                      const Gap(10),
                      buildListTile(
                        leading: Iconsax.location,
                        traill: Iconsax.arrow_right,
                        text: TextConstant.orderAddress,
                      ),
                      buildListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(TextConstant.warning),
                                content: Text(TextConstant.clear),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  side: BorderSide(
                                                      color: mainBlueColor)),
                                              backgroundColor:
                                                  bagroundColorOFscreen),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            TextConstant.cancel,
                                            style:
                                                TextStyle(color: mainBlueColor),
                                          )),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: mainBlueColor),
                                          onPressed: () {
                                            dataClear(context);
                                          },
                                          child: Text(
                                            TextConstant.clearal,
                                            style: TextStyle(
                                                color: bagroundColorOFscreen),
                                          )),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        leading: Iconsax.data,
                        traill: Iconsax.arrow_right,
                        text: TextConstant.clearAllData,
                      ),
                      const Gap(10),
                      buildListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(TextConstant.warning),
                                content: Text(TextConstant.clear),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  side: BorderSide(
                                                      color: mainBlueColor)),
                                              backgroundColor:
                                                  bagroundColorOFscreen),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            TextConstant.cancel,
                                            style:
                                                TextStyle(color: mainBlueColor),
                                          )),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: mainBlueColor),
                                          onPressed: () {
                                            logout();
                                          },
                                          child: Text(
                                            TextConstant.logout,
                                            style: TextStyle(
                                                color: bagroundColorOFscreen),
                                          )),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        leading: Iconsax.logout5,
                        traill: Iconsax.arrow_right,
                        text: TextConstant.logout,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile({
    required IconData leading,
    required IconData traill,
    required String text,
    void Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leading,
        color: Colors.black,
        size: 30,
      ),
      trailing: Icon(
        traill,
        color: Colors.black,
        size: 25,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
