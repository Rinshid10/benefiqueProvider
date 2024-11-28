import 'dart:io';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class EditPagedForProfile extends StatefulWidget {
  const EditPagedForProfile({super.key});

  @override
  State<EditPagedForProfile> createState() => _EditPagedForProfileState();
}

class _EditPagedForProfileState extends State<EditPagedForProfile> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  File? selectedImage;

  Future<void> take() async {
    var box = await Hive.openBox<ProfileOfbenifique>('saveData');

    List<ProfileOfbenifique>? profileList = box.values.toList();
    if (profileList.isNotEmpty) {
      var profile = profileList.first;
      setState(() {
        username.text = profile.username!;
        password.text = profile.password!;
        phonenumber.text = profile.phonenumber!;
        selectedImage = profile.images != null ? File(profile.images!) : null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    take();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: textAoboshiOne2(
            text: 'Edit Your Profile',
            fontSizes: 20,
            colors: Colors.black,
            fontw: FontWeight.normal),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  pickImageGallery();
                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: selectedImage != null
                      ? FileImage(selectedImage!)
                      : const AssetImage('') as ImageProvider,
                ),
              ),
              Gap(25),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  label: Text(TextConstant.hintTextUser),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Gap(20),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  label: Text(TextConstant.hintTextPassWord),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Gap(20),
              TextFormField(
                controller: phonenumber,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  label: Text(TextConstant.hintTextPhone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Gap(25),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(130, 50),
                      backgroundColor: mainBlueColor),
                  onPressed: () {
                    saveProfile();
                  },
                  child: textAoboshiOne2(
                      text: TextConstant.save,
                      fontSizes: 20,
                      colors: Colors.white,
                      fontw: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveProfile() async {
    final usernameSave = username.text;
    final passwordSave = password.text;
    final phonenumberSave = phonenumber.text;

    var profile = ProfileOfbenifique(
        username: usernameSave,
        password: passwordSave,
        phonenumber: phonenumberSave,
        images: selectedImage?.path);

    var box = await Hive.openBox<ProfileOfbenifique>('saveData');
    await box.putAt(0, profile);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(TextConstant.profilesave)));
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  Future pickImageGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    } else {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }
}
