import 'package:flutter/material.dart';

/// An atom for the empty state:
class EmptyMessage extends StatelessWidget {
  const EmptyMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}