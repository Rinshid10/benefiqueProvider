import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Profilefunction extends ChangeNotifier {
  List<ProfileOfbenifique> getProfileDetils = [];
  
Future addProfileData(ProfileOfbenifique values) async {
  final adddataofp = await Hive.openBox<ProfileOfbenifique>('saveData');
  adddataofp.add(values);
  getProfileDetils.add(values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  notifyListeners();
}

Future getAllProfile() async {
  final adddataofp = await Hive.openBox<ProfileOfbenifique>('saveData');
  getProfileDetils.clear();
  getProfileDetils.addAll(adddataofp.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  notifyListeners();
}
}



