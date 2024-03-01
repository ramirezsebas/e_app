import 'package:e_app/app/core/widgets/e_app_bar.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DetailMovementScreen extends StatelessWidget {
  const DetailMovementScreen({super.key});

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
          child: const Column(
            children: [
              Text(
                'Café de aca',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Gs. 2.500.000',
                style: TextStyle(
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
        children: const [
          ListTile(
            title: Text('Operación:'),
            trailing: Text('Transferencia a terceros'),
          ),
          ListTile(
            title: Text('Fecha:'),
            trailing: Text('12/12/2021'),
          ),
          ListTile(
            title: Text('Hora:'),
            trailing: Text('12:00'),
          ),
          ListTile(
            title: Text('Cod. de referencia:'),
            trailing: Text('1234567890'),
          ),
        ],
      ),
    );
  }
}
