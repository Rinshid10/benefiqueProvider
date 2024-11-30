import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class ProdectDetails extends ChangeNotifier {
  List<Prodectmodel> getProdectDetals = [];
  List<Prodectmodel> getFilterDetails = [];

  Future addProdectTolist(Prodectmodel value) async {
    final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
    prodectDb.add(value);
    getProdectDetals.add(value);
    filteredListOfProduct('All');  // Update filtered list
    notifyListeners();
  }

  Future getAllProdect() async {
    final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
    getProdectDetals.clear();
    getProdectDetals.addAll(prodectDb.values);
    filteredListOfProduct('All');  // Update filtered list
    notifyListeners();
  }

  Future deleteProdect(int index) async {
    final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
    prodectDb.deleteAt(index);
    await getAllProdect();
  }

  Future<void> editingProdect(index, Prodectmodel value) async {
    final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
    prodectDb.putAt(index, value);
    await getAllProdect();
  }

  void filteredListOfProduct(String category) {
    if (category == 'All') {
      getFilterDetails = List.from(getProdectDetals);
    } else {
      getFilterDetails = getProdectDetals.where((product) => product.category == category).toList();
    }
    notifyListeners();
  }
}
