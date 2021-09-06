library custom_extensions;

import 'package:intl/intl.dart';

extension DoubleExt on double {
  String getCurrency() {
    final numberFormat = NumberFormat.simpleCurrency();
    //final numberFormat = NumberFormat("#.##0,00", "es_CO");
    return numberFormat.format(this);
    //return "\$${this.toStringAsFixed(2)}";
  }
}
