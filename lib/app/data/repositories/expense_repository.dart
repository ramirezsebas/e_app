import 'package:e_app/app/domain/models/expense_model.dart';
import 'package:e_app/gen/assets.gen.dart';

class ExpenseRepository {
  final List<ExpenseModel> expenses = [
    ExpenseModel(
      id: '1',
      amount: 412000,
      currency: 'Gs',
      description: 'Restaurantes y bares',
      date: DateTime(
        2022,
        6,
        8,
      ),
      category: 'Restaurantes y bares',
      image: Assets.icons.restaurantBarCategory.path,
    ),
    ExpenseModel(
      id: '2',
      amount: 165549,
      currency: 'Gs',
      description: 'Compras',
      date: DateTime(
        2022,
        6,
        7,
      ),
      category: 'Compras',
      image: Assets.icons.shoppingCategory.path,
    ),
    ExpenseModel(
      id: '3',
      amount: 79800,
      currency: 'Gs',
      description: 'Transporte',
      date: DateTime(
        2022,
        6,
        8,
      ),
      category: 'Transporte',
      image: Assets.icons.transportationCategory.path,
    ),
  ];
  Future<List<ExpenseModel>> getExpenses() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return expenses;
  }
}
