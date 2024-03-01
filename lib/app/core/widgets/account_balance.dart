import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    required this.balance,
    required this.isHidden,
    required this.currency,
    super.key,
    this.onToggle,
  });

  final String currency;
  final num balance;
  final bool isHidden;
  final void Function()? onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Disponible',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatHiddenBalance(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: onToggle,
              icon: !isHidden
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  String _formatHiddenBalance() {
    final formattedBalance = NumberFormat.currency(
      locale: 'es',
      decimalDigits: 0,
      symbol: currency,
      customPattern: '\u00A4 #,###',
    ).format(balance);

    return isHidden
        ? formattedBalance
            .replaceAll(
              RegExp(r'\d'),
              '*',
            )
            .replaceAll('.', '*')
        : formattedBalance;
  }
}