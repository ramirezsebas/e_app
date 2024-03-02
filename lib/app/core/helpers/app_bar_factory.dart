import 'package:e_app/app/core/widgets/account_balance.dart';
import 'package:e_app/app/core/widgets/e_app_bar.dart';
import 'package:e_app/app/presentation/cubits/account_balance/account_balance_cubit.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarFactory {
  static PreferredSizeWidget create(
    BuildContext context,
    int index, {
    required VoidCallback onDrawerTap,
  }) {
    return switch (index) {
      0 => EAppBar(
          title: Assets.images.logo.image(),
          onDrawerTap: () {
            onDrawerTap.call();
          },
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
                      onToggle: context
                          .read<AccountBalanceCubit>()
                          .hideAccountBalance,
                    ),
                  AccountBalanceStatus.error => Center(
                      child: Text(state.error.toString()),
                    ),
                };
              },
            ),
          ),
        ),
      1 => AppBar(
          backgroundColor: const Color(0xffF7F0ED),
          title: const Text(
            'Transferencias',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                onDrawerTap.call();
              },
              icon: Assets.icons.drawer.image(
                color: const Color(0xffA6A6A6),
              ),
            ),
          ],
        ),
      2 => AppBar(
          backgroundColor: const Color(0xffF7F0ED),
          title: const Text(
            'Análisis',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                onDrawerTap.call();
              },
              icon: Assets.icons.drawer.image(
                color: const Color(0xffA6A6A6),
              ),
            ),
          ],
        ),
      3 => AppBar(
          backgroundColor: const Color(0xffF7F0ED),
          title: const Text(
            'Cuenta',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                onDrawerTap.call();
              },
              icon: Assets.icons.drawer.image(
                color: const Color(0xffA6A6A6),
              ),
            ),
          ],
        ),
      _ => AppBar(
          backgroundColor: const Color(0xffF7F0ED),
          title: const Text('Gastos'),
          centerTitle: true,
          leading: IconButton(
            icon: Assets.icons.backArrow.image(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Assets.icons.drawer.image(
                color: const Color(0xffA6A6A6),
              ),
            ),
          ],
        ),
    };
  }
}
