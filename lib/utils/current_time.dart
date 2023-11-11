import 'package:intl/intl.dart';

String getCurrentDate(){
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}