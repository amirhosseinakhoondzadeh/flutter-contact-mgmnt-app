import 'package:meta/meta.dart';

class CandidateListItem {
  final num id;
  final String name;
  final String status;
  final String jobTitle;
  final String imagePath;

  CandidateListItem(
      {@required this.id,
      @required this.name,
      @required this.status,
      @required this.imagePath,
      @required this.jobTitle});

  @override
  String toString() {
    return 'CandidateListItem{id: $id, name: $name, status: $status, jobTitle: $jobTitle, imagePath: $imagePath}';
  }
}
