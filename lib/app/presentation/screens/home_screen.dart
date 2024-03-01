import 'package:e_app/app/core/widgets/account_balance.dart';
import 'package:e_app/app/core/widgets/e_app_bar.dart';
import 'package:e_app/app/presentation/cubits/account_balance/account_balance_cubit.dart';
import 'package:e_app/app/presentation/cubits/movements/movements_cubit.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Assets.images.logo.image(),
        body: Container(
          margin: const EdgeInsets.only(
            bottom: 80,
          ),
          child: BlocBuilder<AccountBalanceCubit, AccountBalanceState>(
            builder: (context, state) {
              return switch (state.status) {
                AccountBalanceStatus.initial => const Center(
                    child: CircularProgressIndicator(),
                  ),
                AccountBalanceStatus.loading => const Center(
                    child: CircularProgressIndicator(),
                  ),
                AccountBalanceStatus.loaded => AccountBalance(
                    balance: state.account!.balance,
                    isHidden: state.account!.isHidden,
                    currency: state.account!.currency,
                    onToggle:
                        context.read<AccountBalanceCubit>().hideAccountBalance,
                  ),
                AccountBalanceStatus.error => Center(
                    child: Text(state.error.toString()),
                  ),
              };
            },
          ),
        ),
      ),
      body: BlocBuilder<MovementsCubit, MovementsState>(
        builder: (context, state) {
          return switch (state.runtimeType) {
            MovementsInitial => const Center(
                child: CircularProgressIndicator(),
              ),
            MovementsLoading => const Center(
                child: CircularProgressIndicator(),
              ),
            MovementsLoaded => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Movimientos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: (state as MovementsLoaded).movements.length,
                        itemBuilder: (context, index) {
                          final movement = state.movements[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Image.asset(movement.image),
                            title: Text(
                              movement.sender,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(movement.description),
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${movement.currency}. ${movement.amount}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(movement.date),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            MovementsError => Center(
                child: Text((state as MovementsError).error),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
