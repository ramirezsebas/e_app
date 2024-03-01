import 'package:equatable/equatable.dart';

class ExpenseModel extends Equatable {
  const ExpenseModel({
    required this.id,
    required this.amount,
    required this.currency,
    required this.description,
    required this.date,
    required this.category,
    required this.image,
  });

  final String id;
  final num amount;
  final String currency;
  final String description;
  final DateTime date;
  final String category;
  final String image;

  @override
  List<Object?> get props => [
        id,
        amount,
        currency,
        description,
        date,
        category,
        image,
      ];
}
