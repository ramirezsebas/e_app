import 'package:equatable/equatable.dart';

class ExpenseCategoryModel extends Equatable {
  const ExpenseCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.total,
  });

  final String id;
  final String name;
  final String image;
  final num total;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        total,
      ];
}
