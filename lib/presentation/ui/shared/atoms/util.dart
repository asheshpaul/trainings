import 'package:intl/intl.dart';

String buildMonthDateFormat(DateTime date) => DateFormat('MMM dd').format(date);
String buildDateFormat(DateTime date) => DateFormat('dd').format(date);
String buildYearFormat(DateTime date) => DateFormat('yyyy').format(date);