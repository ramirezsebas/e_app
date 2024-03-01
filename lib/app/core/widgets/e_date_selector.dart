import 'package:flutter/material.dart';

class EDateSelector extends StatelessWidget {
  const EDateSelector({
    required List<String> months,
    required String year,
    required int selectedMonth,
    void Function(int)? onMonthSelected,
    super.key,
  })  : _months = months,
        _year = year,
        _onMonthSelected = onMonthSelected,
        _selectedMonth = selectedMonth;

  final List<String> _months;
  final String _year;
  final int _selectedMonth;
  final void Function(int)? _onMonthSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(width: 10);
      },
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: _months.length,
      itemBuilder: (context, index) {
        final month = _months[index];
        return TextButton(
          onPressed: () {
            _onMonthSelected?.call(index);
          },
          child: Text(
            '$month $_year',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: _selectedMonth == (index + 1)
                  ? const Color(0xffDF0A5D)
                  : Colors.black,
              decorationColor: const Color(0xffDF0A5D),
              decoration: _selectedMonth == (index + 1)
                  ? TextDecoration.underline
                  : null,
            ),
          ),
        );
      },
    );
  }
}
