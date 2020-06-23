import 'package:intl/intl.dart';

class DateConverter {
  //Exp : 10/19/1969
  static DateTime convertDateStringToDateTime(String dateString) {
    if (dateString.isEmpty ?? true) return null;
    final date = DateFormat('dd/MM/yyyy').parse(dateString);
    return date;
  }

  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
