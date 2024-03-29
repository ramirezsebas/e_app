// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:e_app/app/core/constants/date_constants.dart';
import 'package:e_app/app/core/extensions/formatter_extension.dart';
import 'package:e_app/app/core/widgets/e_center_pie_chart_label.dart';
import 'package:e_app/app/core/widgets/e_date_selector.dart';
import 'package:e_app/app/core/widgets/e_drawer.dart';
import 'package:e_app/app/data/repositories/expense_repository.dart';
import 'package:e_app/app/domain/models/expense_category_model.dart';
import 'package:e_app/app/presentation/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:e_app/app/presentation/cubits/category_expenses/categories_expenses_cubit.dart';

import 'package:e_app/app/presentation/cubits/expenses/expenses_cubit.dart';
import 'package:e_app/app/presentation/cubits/month_selector/month_selector_cubit.dart';
import 'package:e_app/app/presentation/screens/selected_category_expense_analytics_screen.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

class ExpenseAnalyticsScreen extends StatelessWidget {
  const ExpenseAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpenseAnalyticsView();
  }
}

class ExpenseAnalyticsView extends StatefulWidget {
  const ExpenseAnalyticsView({
    super.key,
  });

  @override
  State<ExpenseAnalyticsView> createState() => _ExpenseAnalyticsViewState();
}

class _ExpenseAnalyticsViewState extends State<ExpenseAnalyticsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EDrawer(
        onDrawerTap: (index) {
          Navigator.popUntil(context, (route) => route.isFirst);
          context.read<BottomNavigationCubit>().updateIndex(index);
        },
      ),
      backgroundColor: const Color(0xffF7F0ED),
      appBar: AppBar(
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
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Assets.icons.drawer.image(
                  color: const Color(0xffA6A6A6),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffDF0A5D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 65),
        ),
        onPressed: () {},
        child: const Text(
          'Ver Extracto',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<CategoriesExpensesCubit, CategoriesExpensesState>(
        builder: (context, state) {
          return switch (state.runtimeType) {
            CategoriesExpensesInitial => const Center(
                child: CircularProgressIndicator(),
              ),
            CategoriesExpensesLoading => const Center(
                child: CircularProgressIndicator(),
              ),
            CategoriesExpensesLoaded => _Body(
                expenses:
                    (state as CategoriesExpensesLoaded).categoriesExpenses,
                dataMap: context
                    .read<CategoriesExpensesCubit>()
                    .makeDataMap(state.categoriesExpenses),
              ),
            CategoriesExpensesError => Center(
                child: Text((state as ExpensesError).message),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required List<ExpenseCategoryModel> expenses,
    required Map<String, double> dataMap,
  })  : _expenses = expenses,
        _dataMap = dataMap;

  final List<ExpenseCategoryModel> _expenses;
  final Map<String, double> _dataMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: EDateSelector(
            months: months,
            year: year.toString(),
            selectedMonth:
                context.watch<MonthSelectorCubit>().state.selectedMonth!,
            onMonthSelected: (month) {
              context.read<MonthSelectorCubit>().selectMonth(
                    month,
                    (100000 + (10000000 - 100000) * Random().nextDouble())
                        .round(),
                  );
            },
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      dataMap: _dataMap,
                      legendOptions: const LegendOptions(
                        showLegends: false,
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: false,
                        showChartValues: false,
                      ),
                    ),
                    Align(
                      child: ECenterPieChartLabel(
                        label: months[context
                                .read<MonthSelectorCubit>()
                                .state
                                .selectedMonth! -
                            1],
                        description: context
                            .read<MonthSelectorCubit>()
                            .state
                            .total!
                            .toGs(),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (context, index) {
                      final expense = _expenses[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (_) => MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (_) => ExpensesCubit(
                                      expenseRepository:
                                          context.read<ExpenseRepository>(),
                                    )..getExpenses(expense.name),
                                  ),
                                ],
                                child:
                                    const SelectedCategoryExpenseAnalyticsScreen(),
                              ),
                            ),
                          );
                        },
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            expense.image,
                          ),
                        ),
                        title: Text(
                          expense.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Text(
                          expense.total.toGs(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
