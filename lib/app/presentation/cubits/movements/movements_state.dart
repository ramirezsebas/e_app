part of 'movements_cubit.dart';

sealed class MovementsState extends Equatable {
  const MovementsState();

  @override
  List<Object> get props => [];
}

final class MovementsInitial extends MovementsState {}

final class MovementsLoading extends MovementsState {}

final class MovementsLoaded extends MovementsState {
  const MovementsLoaded(this.movements);

  final List<MovementeModel> movements;

  @override
  List<Object> get props => [movements];
}

final class MovementsError extends MovementsState {
  const MovementsError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
