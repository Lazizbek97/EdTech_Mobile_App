// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_udemy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelUdemyAdapter extends TypeAdapter<ModelUdemy> {
  @override
  final int typeId = 0;

  @override
  ModelUdemy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelUdemy(
      url: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      category: (fields[3] as List?)?.cast<String>(),
      thumbnail: fields[4] as String?,
      whatYouWillLearn: fields[5] as String?,
      originalPrice: fields[6] as String?,
      couponCode: fields[7] as String?,
      lastUpdated: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ModelUdemy obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.whatYouWillLearn)
      ..writeByte(6)
      ..write(obj.originalPrice)
      ..writeByte(7)
      ..write(obj.couponCode)
      ..writeByte(8)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelUdemyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
