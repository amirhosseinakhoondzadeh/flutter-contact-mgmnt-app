import 'package:json_annotation/json_annotation.dart';

part 'basic_info.g.dart';

@JsonSerializable()
class BasicInfo {
  final num id;
  final String name;
  final String gender;
  final String photo;
  final String birthday;

  BasicInfo(this.id, this.name, this.gender, this.photo, this.birthday);

  factory BasicInfo.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BasicInfoToJson(this);
}
