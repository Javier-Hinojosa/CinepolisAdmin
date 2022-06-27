import 'package:intl/intl.dart';

extension DateFormating on DateTime{
  String formatDate(){
    return DateFormat("yyyy-MM-dd").format(this);
  }
  String formatHour(){
    return DateFormat("hh:mm aa").format(this);
  }

  String formatDateHour(){
    return DateFormat("yyyy-MM-dd hh:mm aa").format(this);
  }
}
