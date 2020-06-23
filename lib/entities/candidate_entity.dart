import 'package:meta/meta.dart';

class Candidate {
  final num id;
  final String name;
  final String status;
  final String jobTitle;
  final String imagePath;
  final int age;
  final String city;
  final num zipCode;
  final String address;
  final String state;
  final String phone;
  final String email;
  final String industry;

  Candidate({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.imagePath,
    @required this.jobTitle,
    @required this.age,
    @required this.zipCode,
    @required this.email,
    @required this.phone,
    @required this.address,
    @required this.state,
    @required this.city,
    @required this.industry,
  });

  @override
  String toString() {
    return 'Candidate{id: $id, name: $name, status: $status, jobTitle: $jobTitle, imagePath: $imagePath, age: $age, city: $city, zipCode: $zipCode, address: $address, state: $state, phone: $phone, email: $email}';
  }
}
