import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/modal/whislistMOdal/whislistmodal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WhislistProvider extends ChangeNotifier {
  List colors = [
    Colors.blue[50],
    Colors.grey[50],
    Colors.amber[50],
    Colors.red[50],
    Colors.blueGrey[50],
    Colors.teal[50],
    Colors.green[50],
    Colors.amber[50],
    Colors.pink[50],
  ];
  List<WishlistModal> getForWishlist = [];
  Future addStudentTolist(WishlistModal value) async {
    final studentDb = await Hive.openBox<WishlistModal>('save_data');
    studentDb.add(value);

    getForWishlist.add(value);

    notifyListeners();
  }

  void change(Prodectmodel values) async {
    final storeCartItem = WishlistModal(
        name: values.itemname,
        price: values.yourPrice.toString(),
        image: values.images);

    int index =
        getForWishlist.indexWhere((item) => item.name == values.itemname);

    if (index != -1) {
      await deleteWishlist(index);
      values.isWhislist = false;
    } else {
      await saveWishlistItem(storeCartItem);
      values.isWhislist = true;
    }
    notifyListeners();
  }

  Future<void> saveWishlistItem(WishlistModal values) async {
    var box = await Hive.openBox<WishlistModal>('wishlist');
    await box.add(values);
    getForWishlist.addAll(box.values);
    notifyListeners();
  }

  Future<void> getAllWishlist() async {
    final box = await Hive.openBox<WishlistModal>('wishlist');
    getForWishlist = box.values.toList();
    notifyListeners();
  }

  Future<void> deleteWishlist(int index) async {
    final box = await Hive.openBox<WishlistModal>('wishlist');
    await box.deleteAt(index);
    getForWishlist.removeAt(index);
    notifyListeners();
  }
}
