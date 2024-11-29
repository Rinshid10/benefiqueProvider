import 'package:benefique/controller/cartFunction.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/controller/profileFunctions.dart';
import 'package:benefique/controller/whislist.dart';
import 'package:benefique/modal/cartModal/cartModal.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:benefique/modal/whislistMOdal/whislistmodal.dart';
import 'package:benefique/view/LoginAndSpalsh/splash.dart';
import 'package:benefique/view/bottomNavigation/bt.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ProfileOfbenifiqueAdapter().typeId)) {
    Hive.registerAdapter(ProfileOfbenifiqueAdapter());
    Hive.registerAdapter(ProdectmodelAdapter());
  }
  if (!Hive.isAdapterRegistered(ProdectmodelAdapter().typeId)) {
    Hive.registerAdapter(ProdectmodelAdapter());
  }
  if (!Hive.isAdapterRegistered(StoreCartAdapter().typeId)) {
    Hive.registerAdapter(StoreCartAdapter());
  }
  if (!Hive.isAdapterRegistered(WishlistModalAdapter().typeId)) {
    Hive.registerAdapter(WishlistModalAdapter());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Profilefunction()),
          ChangeNotifierProvider(create: (context) => CartFunction()),
          ChangeNotifierProvider(create: (context) => ProdectDetails()),
          ChangeNotifierProvider(
            create: (context) => WhislistProvider(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: Navigationpage()));
  }
}
