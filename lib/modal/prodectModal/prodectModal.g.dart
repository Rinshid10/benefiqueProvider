// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prodectModal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProdectmodelAdapter extends TypeAdapter<Prodectmodel> {
  @override
  final int typeId = 1;

  @override
  Prodectmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Prodectmodel(
      modal: fields[0] as String?,
      itemname: fields[1] as String?,
      yourPrice: fields[2] as String?,
      currentPrice: fields[3] as String?,
      discound: fields[4] as String?,
      country: fields[5] as String?,
      state: fields[6] as String?,
      isInCart: fields[9] as bool,
      isWhislist: fields[10] as bool,
      category: fields[8] as String?,
      images: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Prodectmodel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.modal)
      ..writeByte(1)
      ..write(obj.itemname)
      ..writeByte(2)
      ..write(obj.yourPrice)
      ..writeByte(3)
      ..write(obj.currentPrice)
      ..writeByte(4)
      ..write(obj.discound)
      ..writeByte(5)
      ..write(obj.country)
      ..writeByte(6)
      ..write(obj.state)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.isInCart)
      ..writeByte(10)
      ..write(obj.isWhislist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdectmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
