// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicInfo _$BasicInfoFromJson(Map<String, dynamic> json) {
  return BasicInfo(
    json['id'] as num,
    json['name'] as String,
    json['gender'] as String,
    json['photo'] as String,
    json['birthday'] as String,
  );
}

Map<String, dynamic> _$BasicInfoToJson(BasicInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'photo': instance.photo,
      'birthday': instance.birthday,
    };
