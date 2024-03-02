import 'package:bloc/bloc.dart';
import 'package:e_app/app/data/repositories/expense_repository.dart';
import 'package:e_app/app/domain/models/expense_category_model.dart';
import 'package:equatable/equatable.dart';

part 'categories_expenses_state.dart';

class CategoriesExpensesCubit extends Cubit<CategoriesExpensesState> {
  CategoriesExpensesCubit({
    required ExpenseRepository expenseRepository,
  })  : _expenseRepository = expenseRepository,
        super(CategoriesExpensesInitial());

  final ExpenseRepository _expenseRepository;

  Future<void> getCategoriesExpenses() async {
    emit(CategoriesExpensesLoading());
    try {
      final categoriesExpenses =
          await _expenseRepository.getAllExpensesCategory();

      emit(
        CategoriesExpensesLoaded(
          categoriesExpenses: categoriesExpenses,
          expensesByCategory: makeDataMap(categoriesExpenses),
        ),
      );
    } catch (e) {
      emit(CategoriesExpensesError(e.toString()));
    }
  }

  Map<String, double> makeDataMap(List<ExpenseCategoryModel> expenses) {
    final dataMap = <String, double>{};
    for (final element in expenses) {
      if (dataMap.containsKey(element.name)) {
        dataMap[element.name] = dataMap[element.name]! + element.total;
      } else {
        dataMap[element.name] = element.total.toDouble();
      }
    }
    return dataMap;
  }
}
