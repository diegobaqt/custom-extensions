import 'package:package_info_plus/package_info_plus.dart';

bool _isEmpty(dynamic value) {
  if (value is String) {
    return value.toString().trim().isEmpty;
  }
  if (value is Iterable || value is Map) {
    return (value.isEmpty as bool?) ?? false;
  }
  return false;
}

class Utils {
  Utils._();

  /// Checks if data is null.
  static bool isNull(dynamic value) => value == null;

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }

    // Pretty sure that isNullOrBlank should't be validating
    // iterables... but I'm going to keep this for compatibility.
    return _isEmpty(value);
  }

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool isBlank(dynamic value) {
    return _isEmpty(value);
  }

  static bool isValidPassword(String value) {
    // ignore: unnecessary_raw_strings
    return RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,15}').hasMatch(value);
  }

  static Future<String> appVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
