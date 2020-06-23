import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final num id;
  final String address;
  final String city;
  final String state;
  @JsonKey(name: "zip_code")
  final num zipCode;

  Address(this.id, this.address, this.city, this.state, this.zipCode);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
