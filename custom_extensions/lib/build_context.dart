library custom_extensions;

import 'package:flutter/material.dart';

extension MAContext on BuildContext {
  hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}
