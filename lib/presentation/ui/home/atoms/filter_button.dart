import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final Function() onPressed;

  const FilterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      label: const Text("Filter"),
      icon: const Icon(Icons.filter_list),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
