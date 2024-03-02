import 'dart:math';

import 'package:e_app/app/core/constants/date_constants.dart';
import 'package:e_app/app/core/extensions/date_extension.dart';
import 'package:e_app/app/core/extensions/formatter_extension.dart';
import 'package:e_app/app/core/widgets/e_center_pie_chart_label.dart';
import 'package:e_app/app/core/widgets/e_date_selector.dart';
import 'package:e_app/app/core/widgets/e_drawer.dart';
import 'package:e_app/app/domain/models/expense_model.dart';
import 'package:e_app/app/presentation/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:e_app/app/presentation/cubits/expenses/expenses_cubit.dart';
import 'package:e_app/app/presentation/cubits/month_selector/month_selector_cubit.dart';
import 'package:e_app/app/presentation/screens/detail_movement_screen.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pie_chart/pie_chart.dart';

class SelectedCategoryExpenseAnalyticsScreen extends StatelessWidget {
  const SelectedCategoryExpenseAnalyticsScreen({
    super.key,
  });

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
            fontSize: 18,
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
      body: BlocBuilder<ExpensesCubit, ExpensesState>(
        builder: (context, state) {
          return switch (state.runtimeType) {
            ExpensesInitial => const Center(
                child: CircularProgressIndicator(),
              ),
            ExpensesLoading => const Center(
                child: CircularProgressIndicator(),
              ),
            ExpensesLoaded => _Body(
                expenses: (state as ExpensesLoaded).expenses,
                dataMap: state.dataMap,
                imageCategory: state.imageCategory,
              ),
            ExpensesError => Center(
                child: Text(
                  (state as ExpensesError).message,
                ),
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
    required List<ExpenseModel> expenses,
    required Map<String, double> dataMap,
    required this.imageCategory,
  })  : _expenses = expenses,
        _dataMap = dataMap;

  final List<ExpenseModel> _expenses;
  final Map<String, double> _dataMap;
  final String imageCategory;

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
                          final expense = _expenses[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => DetailMovementScreen(
                                description: expense.description,
                                amount: expense.amount,
                                category: expense.category,
                                date: expense.date,
                                referenceCode: expense.referenceCode,
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
                          expense.description,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          expense.category,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              expense.amount.toGs(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              expense.date.toFormattedString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
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
