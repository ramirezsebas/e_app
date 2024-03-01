import 'package:bloc/bloc.dart';
import 'package:e_app/app/data/repositories/movements_repository.dart';
import 'package:e_app/app/domain/models/movement_model.dart';
import 'package:equatable/equatable.dart';

part 'movements_state.dart';

class MovementsCubit extends Cubit<MovementsState> {
  MovementsCubit({
    required MovementsRepository movementsRepository,
  })  : _movementsRepository = movementsRepository,
        super(MovementsInitial());

  final MovementsRepository _movementsRepository;

  Future<void> getMovements() async {
    emit(MovementsLoading());
    try {
      final movements = await _movementsRepository.getMovements();
      emit(MovementsLoaded(movements));
    } catch (e) {
      emit(MovementsError(e.toString()));
    }
  }
}
