import 'package:e_app/app/core/extensions/date_extension.dart';
import 'package:e_app/app/core/extensions/formatter_extension.dart';
import 'package:e_app/app/core/widgets/e_app_bar.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DetailMovementScreen extends StatelessWidget {
  const DetailMovementScreen({
    required this.description,
    required this.amount,
    required this.category,
    required this.date,
    required this.referenceCode,
    super.key,
  });

  final String description;
  final num amount;
  final String category;
  final DateTime date;
  final String referenceCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        leading: IconButton(
          icon: Assets.icons.backArrow.image(
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Movimientos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(
            bottom: 80,
          ),
          child: Column(
            children: [
              Text(
                description,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                amount.toGs(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Operación:'),
            trailing: Text(category),
          ),
          ListTile(
            title: const Text('Fecha:'),
            trailing: Text(date.toFormattedString()),
          ),
          ListTile(
            title: const Text('Hora:'),
            trailing: Text(date.toTime()),
          ),
          ListTile(
            title: const Text('Cod. de referencia:'),
            trailing: Text(referenceCode),
          ),
        ],
      ),
    );
  }
}
