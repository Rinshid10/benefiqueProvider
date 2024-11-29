import 'package:benefique/modal/cartModal/cartModal.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class CartFunction extends ChangeNotifier {
  List imagefoWhislist = [
    'asset/addidasIConsimages.jpg',
    'asset/converseiconimage.png',
    'asset/pumaIconimage.jpg',
    'asset/nikeimageicocn.png',
    'asset/newbalanceIcons.png'
  ];
  List<StoreCart> getForStore = [];
  String addTocartChange = 'Add to Cart';
  

  Future<void> initializeCart() async {
    var box = await Hive.openBox<StoreCart>('cartBox');
    getForStore = box.values.toList();
    notifyListeners();
  }

  void change(Prodectmodel values) async {
    final storeCartItem = StoreCart(
        itemsName: values.itemname,
        price: values.yourPrice.toString(),
        image: values.images);

    int index =
        getForStore.indexWhere((item) => item.itemsName == values.itemname);

    if (index != -1) {
      await deleteCart(index);
      values.isInCart = false;
    } else {
      await saveCartItem(storeCartItem);
      values.isInCart = true;
    }
    notifyListeners();
  }

  Future<void> saveCartItem(StoreCart cartItem) async {
    var box = await Hive.openBox<StoreCart>('cartBox');
    await box.add(cartItem);
    getForStore.add(cartItem);
    notifyListeners();
  }

  Future<void> getAllCart() async {
    final box = await Hive.openBox<StoreCart>('cartBox');
    getForStore = box.values.toList();
    notifyListeners();
  }

  Future<void> deleteCart(int index) async {
    final box = await Hive.openBox<StoreCart>('cartBox');
    await box.deleteAt(index);
    getForStore.removeAt(index);
    notifyListeners();
  }
}
