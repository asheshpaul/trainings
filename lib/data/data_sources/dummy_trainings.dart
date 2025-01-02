import 'dart:math';

import '../models/address_model.dart';
import '../models/training_model.dart';

final List<String> filterCategories = [
  'Sort By',
  'Location',
  'Training Name',
  'Trainer'
];

List<Training> getDummyTrainings() {
  final random = Random();

  List<String> trainerNames = [
    'John Doe',
    'Jane Smith',
    'Michael Brown',
    'Emily Davis',
    'Chris Wilson'
  ];

  List<String> trainerImgs = [
    'assets/images/avatars/1.png',
    'assets/images/avatars/2.png',
    'assets/images/avatars/3.png',
    'assets/images/avatars/4.png',
    'assets/images/avatars/5.png',
  ];

  List<String> bannerImages = [
    "assets/images/slider/1.jpg",
    "assets/images/slider/2.jpg",
    "assets/images/slider/3.jpg",
    "assets/images/slider/2.jpg",
    "assets/images/slider/1.jpg",
  ];

  List<String> countries = [
    'USA',
    'India',
    'Germany',
    'Australia',
    'Canada',
  ];

  Map<String, List<String>> cities = {
    'USA': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'],
    'India': ['Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', 'Chennai'],
    'Germany': ['Berlin', 'Munich', 'Frankfurt', 'Hamburg', 'Cologne'],
    'Australia': ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Adelaide'],
    'Canada': ['Toronto', 'Vancouver', 'Montreal', 'Calgary', 'Ottawa'],
  };

  List<Training> trainings = [];

  for (int i = 0; i < 10; i++) {
    String country = countries[random.nextInt(countries.length)];
    String city = cities[country]![random.nextInt(5)];

    trainings.add(
      Training(
        bannerImage: bannerImages[random.nextInt(bannerImages.length)],
        titleHeader: 'Filling Fast!',
        title: 'SDE Training ${i + 1}',
        summary: 'Learn and grow with this specialized training program.',
        rating: (random.nextDouble() * 4 + 1).toDouble(),
        address: Address(
          place: 'Convention Hall ${i + 1}',
          city: city,
          countryName: country,
          countryCode: country.substring(0, 2).toUpperCase(),
        ),
        fromDateTime: DateTime.now().add(Duration(days: random.nextInt(30))),
        toDateTime: DateTime.now().add(Duration(days: random.nextInt(30) + 1)),
        actualPrice: 200.0 + random.nextDouble() * 300,
        offerPrice: 150.0 + random.nextDouble() * 150,
        trainerTitle: "Keynote Speaker",
        trainerName: trainerNames[random.nextInt(trainerNames.length)],
        trainerImg: trainerImgs[random.nextInt(trainerImgs.length)],
      ),
    );
  }

  return trainings;
}
