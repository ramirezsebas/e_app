part of 'account_balance_cubit.dart';

enum AccountBalanceStatus {
  initial,
  loading,
  loaded,
  error,
}

class AccountBalanceState extends Equatable {
  const AccountBalanceState({
    this.account,
    this.error,
    this.status = AccountBalanceStatus.initial,
  });

  final AccountModel? account;
  final AccountBalanceStatus status;
  final Object? error;

  AccountBalanceState copyWith({
    AccountModel? account,
    AccountBalanceStatus? status,
    Object? error,
  }) {
    return AccountBalanceState(
      account: account ?? this.account,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [account, status, error];
}
