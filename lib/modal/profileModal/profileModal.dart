import 'package:hive_flutter/adapters.dart';
part 'profileModal.g.dart';

@HiveType(typeId: 0)
class ProfileOfbenifique {
  @HiveField(0)
  String? username;
  @HiveField(1)
  String? password;

  @HiveField(2)
  String? phonenumber;

  @HiveField(3)
  String? images;

  ProfileOfbenifique(
      {required this.username,
      this.images,
      required this.password,
      required this.phonenumber});
}
