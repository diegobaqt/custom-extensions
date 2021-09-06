library custom_extensions;

import 'package:custom_extensions/utils/utils.dart';

extension DynamicUtils<T> on T {
  bool get isNull => Utils.isNull(this);

  bool get isBlank => Utils.isBlank(this);

  bool get isNullOrBlank => Utils.isNullOrBlank(this);
}
