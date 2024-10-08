import 'package:flutter/material.dart';

class AdditionalInfoItem  extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfoItem ({
    super.key,
    required this.icon,
    required this.label,
    required this.value
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,size: 35,
        ),
        const SizedBox(height: 12,),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w100,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}