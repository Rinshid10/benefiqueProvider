import 'package:benefique/modal/cartModal/cartModal.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class prodectDetails extends ChangeNotifier {
  List<Prodectmodel> getProdectDetals = [];
  List<Prodectmodel> getFilterDetails = [];
  
  Future addProdectTolist(Prodectmodel value) async {
    final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
    prodectDb.add(value);

    getProdectDetals.add(value);

    notifyListeners();
  }

  Future getAllProdect() async {
    final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
    getProdectDetals.clear();
    getProdectDetals.addAll(prodectDb.values);

    notifyListeners();
  }

  Future deleteProdect(int index) async {
    final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
    prodectDb.deleteAt(index);
    getAllProdect();
  }

  Future<void> editingProdect(index, Prodectmodel value) async {
    final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');

    getProdectDetals.clear();
    getProdectDetals.addAll(prodectDb.values);
    notifyListeners();
    prodectDb.putAt(index, value);
    getAllProdect();
  }

  void filteredListOfProduct(String category) {
    final prod = getProdectDetals;
    if (category == 'All') {
      getFilterDetails = prod;
    } else {
      getFilterDetails =
          prod.where((product) => product.category == category).toList();
    }
  }
}
