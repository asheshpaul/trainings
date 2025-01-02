import 'package:flutter/material.dart';

import '../../shared/atoms/colors.dart';

/// An atom for the enrollment button:
class EnrollButton extends StatelessWidget {
  const EnrollButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        backgroundColor: AppColors.primary,
      ),
      child: const Text('Enrol Now', semanticsLabel: 'Enroll in training'),
    );
  }
}
