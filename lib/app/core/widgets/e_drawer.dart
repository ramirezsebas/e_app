import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class EDrawer extends StatelessWidget {
  const EDrawer({
    required this.onDrawerTap,
    super.key,
  });

  final void Function(int) onDrawerTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xffDF0A5D),
            ),
            child: Center(
              child: Assets.images.logo.image(
                width: 100,
                height: 100,
              ),
            ),
          ),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              onDrawerTap(0);
            },
          ),
          ListTile(
            title: const Text('Transferencias'),
            onTap: () {
              Navigator.pop(context);
              onDrawerTap(1);
            },
          ),
          ListTile(
            title: const Text('Análisis'),
            onTap: () {
              Navigator.pop(context);
              onDrawerTap(2);
            },
          ),
          ListTile(
            title: const Text('Cuenta'),
            onTap: () {
              Navigator.pop(context);
              onDrawerTap(3);
            },
          ),
        ],
      ),
    );
  }
}
