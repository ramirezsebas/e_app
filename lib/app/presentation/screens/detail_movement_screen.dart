import 'package:e_app/app.dart';
import 'package:e_app/app/core/extensions/date_extension.dart';
import 'package:e_app/app/core/extensions/formatter_extension.dart';
import 'package:e_app/app/core/widgets/e_app_bar.dart';
import 'package:e_app/app/core/widgets/e_drawer.dart';
import 'package:e_app/app/presentation/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      endDrawer: EDrawer(
        onDrawerTap: (index) {
          Navigator.popUntil(context, (route) => route.isFirst);
          context.read<BottomNavigationCubit>().updateIndex(index);
        },
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: Builder(
          builder: (context) {
            return EAppBar(
              onDrawerTap: () {
                Scaffold.of(context).openEndDrawer();
              },
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
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        children: [
          ListTile(
            title: const Text(
              'Operación:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Text(
              category,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Fecha:',
              style: TextStyle(
                color: Color(
                  0xff888787,
                ),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            trailing: Text(
              date.toFormattedString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Hora:',
              style: TextStyle(
                color: Color(
                  0xff888787,
                ),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            trailing: Text(
              date.toTime(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Cod. de referencia:',
              style: TextStyle(
                color: Color(
                  0xff888787,
                ),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            trailing: Text(
              referenceCode,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
