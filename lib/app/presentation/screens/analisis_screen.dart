import 'package:e_app/app/core/widgets/e_card.dart';
import 'package:e_app/app/data/repositories/expense_repository.dart';
import 'package:e_app/app/presentation/cubits/expenses/expenses_cubit.dart';
import 'package:e_app/app/presentation/screens/expense_analytics_screen.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalisisScreen extends StatelessWidget {
  const AnalisisScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F0ED),
      appBar: AppBar(
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
            onPressed: () {},
            icon: Assets.icons.drawer.image(
              color: const Color(0xffA6A6A6),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          children: [
            Material(
              clipBehavior: Clip.antiAlias,
              shape: const CircleBorder(),
              elevation: 5,
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF7F0ED),
                ),
                child: Assets.icons.analyticsShape.image(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '¿Qué deseas revisar?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color(0xffF00E51),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ECard(
                  title: 'Ingresos',
                  icon: Assets.icons.income.image(),
                ),
                ECard(
                  title: 'Gastos',
                  icon: Assets.icons.expense.image(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => BlocProvider(
                          create: (_) => ExpensesCubit(
                            expenseRepository:
                                context.read<ExpenseRepository>(),
                          )..getExpenses(),
                          child: const ExpenseAnalyticsScreen(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
