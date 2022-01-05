// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoAdapter extends TypeAdapter<Repo> {
  @override
  final int typeId = 1;

  @override
  Repo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repo(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String?,
      language: fields[3] as String?,
      openIssuesCount: fields[4] as int,
      starCount: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Repo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.openIssuesCount)
      ..writeByte(5)
      ..write(obj.starCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      language: json['language'] as String?,
      openIssuesCount: json['open_issues_count'] as int,
      starCount: json['stargazers_count'] as int,
    );
