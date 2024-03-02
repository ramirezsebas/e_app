import 'package:bloc/bloc.dart';
import 'package:e_app/app/data/repositories/expense_repository.dart';
import 'package:e_app/app/domain/models/expense_model.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:equatable/equatable.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit({
    required ExpenseRepository expenseRepository,
  })  : _expenseRepository = expenseRepository,
        super(ExpensesInitial());

  final ExpenseRepository _expenseRepository;

  Future<void> getExpenses(String category) async {
    emit(ExpensesLoading());
    try {
      final expenses = await _expenseRepository.getExpensesByCategory(category);
      final imageCategory = switch (category) {
        'Restaurantes y bares' => Assets.icons.restaurantBarCategory.path,
        'Compras' => Assets.icons.shoppingCategory.path,
        'Transporte' => Assets.icons.transportationCategory.path,
        _ => Assets.icons.shoppingCategory.path,
      };

      emit(
        ExpensesLoaded(
          expenses: expenses,
          dataMap: makeDataMap(expenses),
          imageCategory: imageCategory,
        ),
      );
    } catch (e) {
      emit(ExpensesError(e.toString()));
    }
  }

  Map<String, double> makeDataMap(List<ExpenseModel> expenses) {
    final dataMap = <String, double>{};
    for (final element in expenses) {
      if (dataMap.containsKey(element.category)) {
        dataMap[element.category] = dataMap[element.category]! + element.amount;
      } else {
        dataMap[element.category] = element.amount.toDouble();
      }
    }
    return dataMap;
  }
}
