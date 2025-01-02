import 'package:flutter/material.dart';

import '../../../../data/models/address_model.dart';

/// An atom to display the formatted address:
class TrainingAddress extends StatelessWidget {
  const TrainingAddress({super.key, required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Text(
      address.formattedAddress,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}