library custom_extensions;

import 'package:flutter/widgets.dart';

extension SizedBoxExt on SizedBox {
  static const double _defaultMargin = 16;

  static SizedBox fromHeight(double height) => SizedBox(height: height);

  static SizedBox fromHeightDefault() => const SizedBox(height: _defaultMargin);

  static SizedBox fromWidth(double width) => SizedBox(width: width);

  static SizedBox fromWidthDefault() => const SizedBox(width: _defaultMargin);
}
