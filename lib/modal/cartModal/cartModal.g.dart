// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartModal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreCartAdapter extends TypeAdapter<StoreCart> {
  @override
  final int typeId = 2;

  @override
  StoreCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreCart(
      itemsName: fields[1] as String?,
      image: fields[2] as String?,
      price: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreCart obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.itemsName)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
