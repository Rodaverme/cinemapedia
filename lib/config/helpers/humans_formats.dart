import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formatterNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '', locale: 'es')
            .format(number);
    return formatterNumber;
  }
}
