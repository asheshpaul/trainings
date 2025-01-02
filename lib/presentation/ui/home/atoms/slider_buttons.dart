import 'package:flutter/material.dart';

import '../../shared/atoms/colors.dart';
import '../../shared/atoms/slider_styles.dart';

class ChangeSliderButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;

  const ChangeSliderButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 100,
            color: AppColors.black26,
            child: Center(
              child: Icon(
                iconData,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ViewDetailsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewDetailsButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: const Text('View Details'),
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.arrow_forward),
      style: viewDetailsButtonStyle(),
    );
  }
}
