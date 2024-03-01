import 'package:e_app/app.dart';
import 'package:e_app/app/presentation/cubits/account_balance/account_balance_cubit.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Assets.icons.drawer.image(),
        ),
      ],
      title: Assets.images.logo.image(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 80,
          ),
          child: AccountBalance(
            balance: context.select<AccountBalanceCubit, double>(
              (cubit) => cubit.state.balance!,
            ),
            currency: context.select<AccountBalanceCubit, String>(
              (cubit) => cubit.state.currency!,
            ),
            isHidden: context.select<AccountBalanceCubit, bool>(
              (cubit) => cubit.state.isHidden!,
            ),
            onToggle: context.read<AccountBalanceCubit>().toggleAccountBalance,
          ),
        ),
      ),
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xffF00E51),
              Color(0xffFF6720),
              Color(0xffFF9E1B),
            ],
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(250);
}
