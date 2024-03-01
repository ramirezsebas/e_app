import 'package:e_app/app/core/widgets/e_date_selector.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

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
      body: Column(
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
          Container(
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
                text: _months[_selectedMonth - 1],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: const [
                  TextSpan(
                    text: '\n Gs. 2.000.000',
                    style: TextStyle(
                      color: Color(0xffF00E51),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Assets.icons.restaurantBarCategory.image(),
            title: const Text(
              'Detalle de gastos',
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
              'Detalle de gastos',
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
              'Detalle de gastos',
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
    );
  }
}
