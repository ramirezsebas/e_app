part of 'categories_expenses_cubit.dart';

sealed class CategoriesExpensesState extends Equatable {
  const CategoriesExpensesState();

  @override
  List<Object> get props => [];
}

final class CategoriesExpensesInitial extends CategoriesExpensesState {}

final class CategoriesExpensesLoading extends CategoriesExpensesState {}

final class CategoriesExpensesLoaded extends CategoriesExpensesState {
  const CategoriesExpensesLoaded({
    required this.categoriesExpenses,
    required this.expensesByCategory,
  });

  final List<ExpenseCategoryModel> categoriesExpenses;
  final Map<String, double> expensesByCategory;

  @override
  List<Object> get props => [categoriesExpenses];
}

final class CategoriesExpensesError extends CategoriesExpensesState {
  const CategoriesExpensesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
