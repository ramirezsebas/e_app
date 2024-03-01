part of 'expenses_cubit.dart';

sealed class ExpensesState extends Equatable {
  const ExpensesState();

  @override
  List<Object> get props => [];
}

final class ExpensesInitial extends ExpensesState {}

final class ExpensesLoading extends ExpensesState {}

final class ExpensesLoaded extends ExpensesState {
  const ExpensesLoaded(this.expenses);

  final List<ExpenseModel> expenses;

  @override
  List<Object> get props => [expenses];
}

final class ExpensesError extends ExpensesState {
  const ExpensesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
