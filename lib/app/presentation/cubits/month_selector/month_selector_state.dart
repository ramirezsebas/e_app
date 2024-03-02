part of 'month_selector_cubit.dart';

class MonthSelectorState extends Equatable {
  const MonthSelectorState({
    this.selectedMonth,
    this.total,
  });

  final int? selectedMonth;
  final num? total;

  @override
  List<Object?> get props => [
        selectedMonth,
        total,
      ];
}
