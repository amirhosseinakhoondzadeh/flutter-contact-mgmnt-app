import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

@JsonSerializable()
class Experience {
  final num id;
  final String status;
  @JsonKey(name: "job_title")
  final String jobTitle;
  @JsonKey(name: "company_name")
  final String companyName;
  final String industry;

  Experience(
      this.id, this.status, this.jobTitle, this.companyName, this.industry);

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
