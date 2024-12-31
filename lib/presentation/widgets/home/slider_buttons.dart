import 'package:flutter/material.dart';

import '../../styles/slider_styles.dart';

Widget sliderChangeButton(
    {required VoidCallback onTap, required IconData iconData}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          color: Colors.black26,
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}

TextButton viewDetailsButton({required VoidCallback onPressed}) {
  return TextButton.icon(
    onPressed: onPressed,
    label: const Text('View Details'),
    iconAlignment: IconAlignment.end,
    icon: const Icon(Icons.arrow_forward),
    style: viewDetailsButtonStyle(),
  );
}