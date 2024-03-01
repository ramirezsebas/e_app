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
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
