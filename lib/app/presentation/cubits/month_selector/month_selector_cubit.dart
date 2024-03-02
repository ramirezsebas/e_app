import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'month_selector_state.dart';

class MonthSelectorCubit extends Cubit<MonthSelectorState> {
  MonthSelectorCubit() : super(const MonthSelectorState());

  void init(num total) {
    emit(
      MonthSelectorState(
        selectedMonth: DateTime.now().month,
        total: total,
      ),
    );
  }

  void selectMonth(int month, num total) {
    emit(
      MonthSelectorState(
        selectedMonth: month,
        total: total,
      ),
    );
  }
}
