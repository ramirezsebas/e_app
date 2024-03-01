import 'package:intl/intl.dart';

enum CurrencyLocation { start, end }

extension NumX on num {
  String toCurrency(
    String currency, {
    CurrencyLocation location = CurrencyLocation.start,
  }) {
    return NumberFormat.currency(
      locale: 'es',
      decimalDigits: 0,
      symbol: currency,
      customPattern: location == CurrencyLocation.start
          ? '\u00A4. #,###'
          : '#,### \u00A4.',
    ).format(this);
  }
}
