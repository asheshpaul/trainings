import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// An atom to encapsulate the date and time display:
class TrainingDateTime extends StatelessWidget {
  const TrainingDateTime({super.key, required this.from, required this.to});

  final DateTime from;
  final DateTime to;

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTrainingDateTime(from, to),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  String _formatTrainingDateTime(DateTime from, DateTime to) {
    final monthFormat = DateFormat.MMM(); // Example: "Jan"
    final dateFormat = DateFormat.d(); // Example: "1"
    final yearFormat = DateFormat.y(); // Example: "2023"

    return '${monthFormat.format(from)} ${dateFormat.format(from)} - '
        '${dateFormat.format(to)}, ${yearFormat.format(to)}';
  }
}
