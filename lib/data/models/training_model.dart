import 'address_model.dart';

class Training {
  final String bannerImage;
  final String titleHeader;
  final String title;
  final String summary;
  final double rating;
  final Address address;
  final DateTime fromDateTime;
  final DateTime toDateTime;
  final double actualPrice;
  final double offerPrice;
  final String trainerTitle;
  final String trainerName;
  final String trainerImg;

  Training({
    required this.bannerImage,
    required this.titleHeader,
    required this.title,
    required this.summary,
    required this.rating,
    required this.address,
    required this.fromDateTime,
    required this.toDateTime,
    required this.actualPrice,
    required this.offerPrice,
    required this.trainerTitle,
    required this.trainerName,
    required this.trainerImg,
  });
}
