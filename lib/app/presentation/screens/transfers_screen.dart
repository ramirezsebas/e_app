import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TransfersScreen extends StatelessWidget {
  const TransfersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.logo.image(
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          const Text(
            '¡Pronto podrás realizar transferencias!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
