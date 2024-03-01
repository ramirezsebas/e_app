import 'package:e_app/app/domain/models/movement_model.dart';
import 'package:e_app/gen/assets.gen.dart';

class MovementsRepository {
  final movements = [
    MovementeModel(
      image: Assets.icons.transfers.path,
      amount: 200000,
      currency: 'Gs',
      description: 'Transferencia recibida',
      date: 'Hoy',
      sender: 'Juan Perez',
    ),
    MovementeModel(
      image: Assets.icons.transfers.path,
      amount: 200000,
      currency: 'Gs',
      description: 'Transferencia recibida',
      date: 'Hoy',
      sender: 'Juan Perez',
    ),
    MovementeModel(
      image: Assets.icons.transfers.path,
      amount: 200000,
      currency: 'Gs',
      description: 'Transferencia recibida',
      date: 'Hoy',
      sender: 'Juan Perez',
    ),
  ];

  Future<List<MovementeModel>> getMovements() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return movements;
  }
}
