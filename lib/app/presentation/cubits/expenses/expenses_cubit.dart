import 'package:bloc/bloc.dart';
import 'package:e_app/app/data/repositories/expense_repository.dart';
import 'package:e_app/app/domain/models/expense_model.dart';
import 'package:equatable/equatable.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit({
    required ExpenseRepository expenseRepository,
  })  : _expenseRepository = expenseRepository,
        super(ExpensesInitial());

  final ExpenseRepository _expenseRepository;

  Future<void> getExpenses() async {
    emit(ExpensesLoading());
    try {
      final expenses = await _expenseRepository.getExpenses();
      emit(ExpensesLoaded(expenses));
    } catch (e) {
      emit(ExpensesError(e.toString()));
    }
  }
}
