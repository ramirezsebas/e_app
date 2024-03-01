import 'package:e_app/app/domain/models/movement_model.dart';
import 'package:e_app/gen/assets.gen.dart';

class MovementsRepository {
  final movements = [
    MovementeModel(
      image: Assets.icons.mask.path,
      amount: 1000,
      currency: 'Gs',
      description: 'Entretenimiento',
      date: DateTime(
        2022,
        6,
        8,
      ),
      sender: 'Playstation Network',
      type: MovementType.expense,
    ),
    MovementeModel(
      image: Assets.icons.atm.path,
      amount: 150000,
      currency: 'Gs',
      description: 'Retiros',
      date: DateTime(
        2022,
        6,
        7,
      ),
      sender: 'Banco Regional',
      type: MovementType.income,
    ),
    MovementeModel(
      image: Assets.icons.heart.path,
      amount: 1000000,
      currency: 'Gs',
      description: 'Salud',
      date: DateTime(
        2022,
        6,
        8,
      ),
      sender: 'Punto Farma',
      type: MovementType.expense,
    ),
    MovementeModel(
      image: Assets.icons.transportationCategory.path,
      amount: 150000,
      currency: 'Gs',
      description: 'Transporte',
      date: DateTime(
        2022,
        6,
        7,
      ),
      sender: 'Uber',
      type: MovementType.expense,
    ),
    MovementeModel(
      image: Assets.icons.bag.path,
      amount: 1000000,
      currency: 'Gs',
      description: 'Compras',
      date: DateTime(
        2022,
        6,
        8,
      ),
      sender: 'Feria Asunción',
      type: MovementType.expense,
    ),
    MovementeModel(
      image: Assets.icons.transportationCategory.path,
      amount: 150000,
      currency: 'Gs',
      description: 'Transporte',
      date: DateTime(
        2022,
        6,
        7,
      ),
      sender: 'Uber',
      type: MovementType.expense,
    ),
  ];

  Future<List<MovementeModel>> getMovements() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return movements;
  }
}
