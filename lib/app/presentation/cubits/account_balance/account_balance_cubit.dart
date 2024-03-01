import 'package:bloc/bloc.dart';
import 'package:e_app/app/data/repositories/account_repository.dart';
import 'package:e_app/app/domain/models/account_model.dart';
import 'package:equatable/equatable.dart';

part 'account_balance_state.dart';

class AccountBalanceCubit extends Cubit<AccountBalanceState> {
  AccountBalanceCubit({
    required AccountRepository accountRepository,
  })  : _accountRepository = accountRepository,
        super(const AccountBalanceState());

  final AccountRepository _accountRepository;

  void hideAccountBalance() {
    final isHidden = state.account?.isHidden ?? false;

    emit(
      state.copyWith(
        account: state.account?.copyWith(
          isHidden: !isHidden,
        ),
      ),
    );
  }

  Future<void> getAccount() async {
    emit(
      state.copyWith(
        status: AccountBalanceStatus.loading,
      ),
    );
    try {
      final account = await _accountRepository.getAccount();
      emit(
        state.copyWith(
          status: AccountBalanceStatus.loaded,
          account: account,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AccountBalanceStatus.error,
          error: e.toString(),
        ),
      );
    }
  }
}
