import 'package:benefique/modal/cartModal/cartModal.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class cartFunction extends ChangeNotifier {
  List<StoreCart> getForStore = [];
  List<StoreCart> cartList = [];
  String addTocartChange = 'Add to Cart';

  bool isContain(StoreCart items) {
    return cartList.contains(items);
  }

  void changeCartname(StoreCart itemss) {
    if (isContain(itemss)) {
      getForStore.remove(itemss);
    } else {
      getForStore.add(itemss);
    }

    notifyListeners();
  }

  Future<void> saveCartItem(Prodectmodel cartItem) async {
    var box = await Hive.openBox<StoreCart>('cartBox');
    final storeCartItem = StoreCart(
        itemsName: cartItem.itemname,
        price: cartItem.yourPrice.toString(),
        image: cartItem.images);
    await box.add(storeCartItem);
    getForStore.clear();
    getForStore.addAll(box.values);

    notifyListeners();
  }

  Future<void> getAllCart() async {
    final box = await Hive.openBox<StoreCart>('cartBox');
    getForStore.clear();
    getForStore.addAll(box.values);

    notifyListeners();
  }

  Future deleteCart(int index) async {
    final box = await Hive.openBox<StoreCart>('cartBox');
    box.deleteAt(index);
    getAllCart();
  }
}
