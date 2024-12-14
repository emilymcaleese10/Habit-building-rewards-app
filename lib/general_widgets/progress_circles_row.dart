import 'package:flutter/material.dart';
import 'package:habitus/constants.dart';

class ProgressCirclesRow extends StatelessWidget {
  const ProgressCirclesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: Color(0xFFEDEFF1),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: Color(0xFF009C03),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: Color(0xFF009C03),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: Color(0xFF009C03),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: Color(0xFF009C03),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: Color(0xFFEDEFF1),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: Color(0xFFEDEFF1),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
