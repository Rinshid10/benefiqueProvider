// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whislistmodal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishlistModalAdapter extends TypeAdapter<WishlistModal> {
  @override
  final int typeId = 3;

  @override
  WishlistModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishlistModal(
      price: fields[1] as String?,
      image: fields[2] as String?,
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WishlistModal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishlistModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
