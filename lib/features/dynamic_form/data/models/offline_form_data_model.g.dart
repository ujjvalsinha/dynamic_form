// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_form_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfflineFormDataModelAdapter extends TypeAdapter<OfflineFormDataModel> {
  @override
  final int typeId = 0;

  @override
  OfflineFormDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineFormDataModel(
      data: (fields[0] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, OfflineFormDataModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfflineFormDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
