import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_balance_state.dart';

class AccountBalanceCubit extends Cubit<AccountBalanceState> {
  AccountBalanceCubit() : super(const AccountBalanceState());

  void toggleAccountBalance() {
    emit(state.copyWith(isHidden: !state.isHidden!));
  }
}
