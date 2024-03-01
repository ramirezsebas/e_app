import 'package:e_app/app/core/widgets/e_center_pie_chart_label.dart';
import 'package:e_app/app/core/widgets/e_date_selector.dart';
import 'package:e_app/app/presentation/screens/selected_category_expense_analytics_screen.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
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
  final _year = '2022';
  final _months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];
  var _selectedMonth = DateTime.now().month;

  Map<String, double> dataMap = {
    'Restaurante y bares': 5,
    'Compras': 3,
    'Transporte': 2,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconButton(
            onPressed: () {},
            icon: Assets.icons.drawer.image(
              color: const Color(0xffA6A6A6),
            ),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => SelectedCategoryExpenseAnalyticsView(
                category: 'Restaurantes y bares',
                spending: 'Gs. 2.000.000',
                icon: Assets.icons.restaurantBarCategory.path,
              ),
            ),
          );
        },
        child: const Text(
          'Ver Extracto',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: EDateSelector(
                months: _months,
                year: _year,
                selectedMonth: _selectedMonth,
                onMonthSelected: (index) {
                  setState(() {
                    _selectedMonth = index + 1;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  dataMap: dataMap,
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
                    label: _months[_selectedMonth - 1],
                    description: 'Gs. 2.000.000',
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Assets.icons.restaurantBarCategory.image(),
              title: const Text(
                'Restaurantes y bares',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: const Text(
                'Gs. 2.000.000',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListTile(
              leading: Assets.icons.shoppingCategory.image(),
              title: const Text(
                'Compras',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: const Text(
                'Gs. 2.000.000',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListTile(
              leading: Assets.icons.transportationCategory.image(),
              title: const Text(
                'Transporte',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: const Text(
                'Gs. 2.000.000',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
