import 'package:hive/hive.dart';
part 'prodectModal.g.dart';

@HiveType(typeId: 1)

class Prodectmodel {
  @HiveField(0)
  String? modal;
  @HiveField(1)
  String? itemname;
  @HiveField(2)
  String? yourPrice;
  @HiveField(3)
  String? currentPrice;
  @HiveField(4)
  String? discound;
  @HiveField(5)
  String? country;
  @HiveField(6)
  String? state;
  @HiveField(7)
  String? images;
  @HiveField(8)
  String? category;
 
  Prodectmodel(
      {required this.modal,
      required this.itemname,
      required this.yourPrice,
      required this.currentPrice,
      required this.discound,
      required this.country,
      required this.state,
      this.category,
      this.images});
}
