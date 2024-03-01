import 'package:e_app/app/domain/models/account_model.dart';

class AccountRepository {
  final account = const AccountModel(
    balance: 2000000,
    currency: 'Gs',
  );

  Future<AccountModel> getAccount() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return account;
  }
}
