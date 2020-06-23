// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return Experience(
    json['id'] as num,
    json['status'] as String,
    json['job_title'] as String,
    json['company_name'] as String,
    json['industry'] as String,
  );
}

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'job_title': instance.jobTitle,
      'company_name': instance.companyName,
      'industry': instance.industry,
    };
