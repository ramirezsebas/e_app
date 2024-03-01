import 'package:equatable/equatable.dart';

class MovementeModel extends Equatable {
  const MovementeModel({
    required this.image,
    required this.amount,
    required this.currency,
    required this.description,
    required this.date,
    required this.sender,
  });

  factory MovementeModel.fromJson(Map<String, dynamic> json) {
    return MovementeModel(
      image: json['image'] as String,
      amount: json['amount'] as num,
      currency: json['currency'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      sender: json['sender'] as String,
    );
  }

  final String image;
  final num amount;
  final String currency;
  final String description;
  final String date;
  final String sender;

  @override
  List<Object?> get props =>
      [image, amount, currency, description, date, sender];
}
