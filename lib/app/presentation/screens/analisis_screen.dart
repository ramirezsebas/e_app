import 'package:e_app/app/core/widgets/e_card.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AnalisisScreen extends StatelessWidget {
  const AnalisisScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisis'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.drawer.image(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF7F0ED),
              ),
              child: Assets.icons.analyticsShape.image(),
            ),
            const SizedBox(height: 20),
            const Text(
              '¿Qué deseas revisar?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xffF00E51),
              ),
            ),
            const SizedBox(height: 20),
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
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
