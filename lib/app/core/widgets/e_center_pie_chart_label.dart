import 'package:flutter/material.dart';

class ECenterPieChartLabel extends StatelessWidget {
  const ECenterPieChartLabel({
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
