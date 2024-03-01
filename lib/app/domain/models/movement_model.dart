import 'package:equatable/equatable.dart';

enum MovementType { income, expense }

class MovementeModel extends Equatable {
  const MovementeModel({
    required this.image,
    required this.amount,
    required this.currency,
    required this.description,
    required this.date,
    required this.sender,
    required this.type,
  });

  factory MovementeModel.fromJson(Map<String, dynamic> json) {
    return MovementeModel(
      image: json['image'] as String,
      amount: json['amount'] as num,
      currency: json['currency'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      sender: json['sender'] as String,
      type:
          json['type'] == 'income' ? MovementType.income : MovementType.expense,
    );
  }

  final String image;
  final num amount;
  final String currency;
  final String description;
  final String date;
  final String sender;
  final MovementType type;

  String get sign => type == MovementType.income ? '+' : '-';

  @override
  List<Object?> get props => [
        image,
        amount,
        currency,
        description,
        date,
        sender,
        type,
      ];
}
