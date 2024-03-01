import 'package:flutter/material.dart';

class ECard extends StatelessWidget {
  const ECard({
    required this.title,
    required this.icon,
    this.onTap,
    super.key,
  });

  final String title;
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 130,
        width: 130,
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffF00E51),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
