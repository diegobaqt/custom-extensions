library custom_extensions;

import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  static const String dateTimePattern = "yyyy-MM-dd'T'HH:mm:ss'Z'";

  static const String datePattern = "yyyy-MM-dd";

  String toStringPattern(String pattern) {
    final DateFormat df = DateFormat(pattern);
    try {
      return df.format(this);
    } catch (e) {
      return "";
    }
  }
}
