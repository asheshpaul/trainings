import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../widgets/home/slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainings'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: ListView(
        children: [
          Container(
            color: AppColors.primary,
            child: const ListTile(
              title: Text(
                "Highlights",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const HomeSlider(
            imgList: [
              "assets/images/slider/1.jpg",
              "assets/images/slider/2.jpg",
              "assets/images/slider/3.jpg",
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(children: [
              OutlinedButton.icon(
                onPressed: () {},
                label: const Text("Filter"),
                icon: const Icon(Icons.filter_list),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ]),
          ),
          ListView.separated(
            key: const ValueKey<String>('items_list'),
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 32),
            separatorBuilder: (c, i) => const SizedBox(height: 0),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, index) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Jan 11 - 13, 2025'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
