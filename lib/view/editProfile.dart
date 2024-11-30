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

  @override
  void initState() {
    super.initState();
    take(); // Load existing profile data when the screen is initialized
  }

  // Load profile data from Hive storage
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: textAoboshiOne2(
            text: 'Edit Your Profile',
            fontSizes: 20,
            colors: Colors.white,
            fontw: FontWeight.bold),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  pickImageGallery();
                },
                child: CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                  child: selectedImage != null
                      ? ClipOval(
                          child: Image.file(
                            selectedImage!,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.blueAccent,
                        ),
                ),
              ),
            ),
            Gap(30),
            _buildTextField(
                controller: username, label: TextConstant.hintTextUser),
            Gap(20),
            _buildTextField(
                controller: password, label: TextConstant.hintTextPassWord),
            Gap(20),
            _buildTextField(
                controller: phonenumber, label: TextConstant.hintTextPhone),
            Gap(30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              onPressed: () {
                saveProfile();
              },
              child: Text(
                TextConstant.save,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Custom text field widget with rounded corners and elevation
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        labelText: label,
        labelStyle: TextStyle(color: Colors.black87),
        hintText: 'Enter your $label',
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }

  // Save or update the profile
  Future<void> saveProfile() async {
    final usernameSave = username.text;
    final passwordSave = password.text;
    final phonenumberSave = phonenumber.text;

    var profile = ProfileOfbenifique(
      username: usernameSave,
      password: passwordSave,
      phonenumber: phonenumberSave,
      images: selectedImage?.path,
    );

    var box = await Hive.openBox<ProfileOfbenifique>('saveData');

    // Check if profile already exists
    int existingIndex = -1;
    for (int i = 0; i < box.length; i++) {
      var existingProfile = box.getAt(i);
      if (existingProfile != null && existingProfile.username == usernameSave) {
        existingIndex = i;
        break;
      }
    }

    if (existingIndex != -1) {
      // Update the existing profile
      await box.putAt(existingIndex, profile);
    } else {
      // Add new profile if doesn't exist
      await box.add(profile);
    }

    // Pop the current screen and show the snack bar
    Navigator.pop(context);

    // Add a slight delay before showing the Snackbar
    Future.delayed(Duration(milliseconds: 300), () {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(TextConstant.profilesave)));
    });
  }

  // Pick an image from the gallery
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
