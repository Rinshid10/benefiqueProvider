// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileOfbenifiqueAdapter extends TypeAdapter<ProfileOfbenifique> {
  @override
  final int typeId = 0;

  @override
  ProfileOfbenifique read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileOfbenifique(
      username: fields[0] as String?,
      images: fields[3] as String?,
      password: fields[1] as String?,
      phonenumber: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileOfbenifique obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.phonenumber)
      ..writeByte(3)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileOfbenifiqueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
