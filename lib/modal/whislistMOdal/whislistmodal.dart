import 'package:hive_flutter/hive_flutter.dart';
part 'whislistmodal.g.dart';

@HiveType(typeId: 3)
class WishlistModal {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? price;
  @HiveField(2)
  String? image;
  WishlistModal({required this.price, required this.image, required this.name});
}
