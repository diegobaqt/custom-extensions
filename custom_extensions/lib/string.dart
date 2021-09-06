library custom_extensions;

import 'package:custom_extensions/date_time.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

extension StringExt on String {
  DateTime toDateTime() {
    final DateFormat df = DateFormat(DateTimeExt.dateTimePattern);
    final dateStr = (length > 19) ? "${substring(0, 19)}Z" : this;
    try {
      return df.parseUTC(this).toLocal();
    } catch (e) {
      try {
        return df.parse(dateStr);
      } catch (e) {
        return DateTime.now();
      }
    }
  }

  DateTime toDate() {
    final DateFormat df = DateFormat(DateTimeExt.datePattern);

    try {
      return df.parse(this);
    } catch (e) {
      return DateTime.now();
    }
  }

  bool isValidEmail() {
    if (isEmpty) return false;

    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool isURL() => GetUtils.isURL(this);

  String format(var arguments) => sprintf(this, arguments);

  String? fromDateToDate(String? endTime) {
    try {
      final startTime = this;
      return "${startTime.toDateTime().toStringPattern("h:mm a")} a ${endTime?.toDateTime().toStringPattern("h:mm a")}";
    } catch (e) {
      return null;
    }
  }

  String toShortId() => length > 8 ? substring(length - 8).toUpperCase() : this;

  String? fromDateToDateWithDay(String? endTime) {
    try {
      final startTime = this;
      return "${startTime.toDateTime().toStringPattern("EEEE d")} de "
          "${startTime.toDateTime().toStringPattern("h:mm a")} a "
          "${endTime?.toDateTime().toStringPattern("h:mm a")}";
    } catch (e) {
      return null;
    }
  }

  bool isValidNumber() {
    if (isEmpty) return false;

    return RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(this);
  }

  bool checkRegExp(String pattern) => RegExp(pattern).hasMatch(this);
}
