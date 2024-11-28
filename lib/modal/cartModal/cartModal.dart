import 'package:hive/hive.dart';
part 'cartModal.g.dart';

@HiveType(typeId: 2)
class StoreCart {
  @HiveField(0)
  String? price;
  @HiveField(1)
  String? itemsName;
  @HiveField(2)
  String? image;
  StoreCart({required this.itemsName, this.image, required this.price});
}
