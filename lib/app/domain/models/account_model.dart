import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  const AccountModel({
    required this.balance,
    required this.currency,
    this.isHidden = false,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      balance: json['balance'] as double,
      currency: json['currency'] as String,
    );
  }

  AccountModel copyWith({
    double? balance,
    String? currency,
    bool? isHidden,
  }) {
    return AccountModel(
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  final double balance;
  final String currency;
  final bool isHidden;

  @override
  List<Object?> get props => [balance, currency, isHidden];
}
