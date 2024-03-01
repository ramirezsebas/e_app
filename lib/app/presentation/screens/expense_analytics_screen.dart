import 'package:e_app/app/core/widgets/e_date_selector.dart';
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
    "Restaurante y bares": 5,
    "Compras": 3,
    "Transporte": 2,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.drawer.image(),
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
                  child: CenterPieChartLabel(
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

class CenterPieChartLabel extends StatelessWidget {
  const CenterPieChartLabel({
    required String label,
    required String description,
    super.key,
  })  : _description = description,
        _label = label;

  final String _label;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffF7F0ED),
      ),
      height: 200,
      width: 200,
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: _label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: '\n$_description',
              style: const TextStyle(
                color: Color(0xffF00E51),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
