part of 'account_balance_cubit.dart';

class AccountBalanceState extends Equatable {
  const AccountBalanceState({
    this.balance = 2000000,
    this.currency = 'Gs',
    this.isHidden = false,
  });

  final double? balance;
  final String? currency;
  final bool? isHidden;

  AccountBalanceState copyWith({
    double? balance,
    bool? isHidden,
  }) {
    return AccountBalanceState(
      balance: balance ?? this.balance,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  @override
  List<Object?> get props => [balance, isHidden];
}
