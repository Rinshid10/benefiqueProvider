import 'package:benefique/modal/cartModal/cartModal.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:benefique/view/LoginAndSpalsh/loginFor.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Future dataClear(BuildContext context) async {
  final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
  var box = await Hive.openBox<StoreCart>('cartBox');
  final adddataofp = await Hive.openBox<ProfileOfbenifique>('saveData');
  adddataofp.clear();
  box.clear();
  prodectDb.clear();

  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (ctx) => Login()));
}
