import 'package:intl/intl.dart';

enum CurrencyLocation { start, end }

extension NumX on num {
  String toGs({
    CurrencyLocation location = CurrencyLocation.start,
  }) {
    return NumberFormat.currency(
      locale: 'es',
      decimalDigits: 0,
      customPattern:
          location == CurrencyLocation.start ? "'Gs.' #,###" : "#,### 'Gs.'",
    ).format(this);
  }
}
