part of 'expenses_cubit.dart';

sealed class ExpensesState extends Equatable {
  const ExpensesState();

  @override
  List<Object> get props => [];
}

final class ExpensesInitial extends ExpensesState {}

final class ExpensesLoading extends ExpensesState {}

final class ExpensesLoaded extends ExpensesState {
  const ExpensesLoaded({
    required this.expenses,
    required this.dataMap,
    required this.imageCategory,
  });

  final List<ExpenseModel> expenses;
  final String imageCategory;
  final Map<String, double> dataMap;

  @override
  List<Object> get props => [
        expenses,
        dataMap,
        imageCategory,
      ];
}

final class ExpensesError extends ExpensesState {
  const ExpensesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
