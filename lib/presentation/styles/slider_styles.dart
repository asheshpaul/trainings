import 'package:flutter/material.dart';

import '../../shared/colors.dart';

TextStyle titleTextStyle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 18,
  );
}

TextStyle subTitleTextStyle() => const TextStyle(color: Colors.white);

TextStyle actualPriceTextStyle() {
  return TextStyle(
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.primary,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
}

TextStyle offerPriceTextStyle() {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
}

ButtonStyle viewDetailsButtonStyle() =>
    TextButton.styleFrom(foregroundColor: Colors.white);
