import 'package:flutter/material.dart';

/// An atom to display trainer details:
class TrainerInfo extends StatelessWidget {
  const TrainerInfo({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.name,
  });

  final String imageUrl;
  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(backgroundImage: AssetImage(imageUrl)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(name),
    );
  }
}