import 'package:rydr/utils/images_path.dart';

class RideModel {
  int id;
  String name;
  String image;
  String price;
  String time;
  bool isSelected;

  RideModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.time,
    this.isSelected = false,
  });
}

class RideData {
  static List<RideModel> rideDetails = <RideModel>[
    RideModel(
      image: ImagesAsset.regular,
      isSelected: true,
      name: "Rydr Regular",
      price: "1,100",
      time: "07: 38 pm",
      id: 1,
    ),
    RideModel(
      image: ImagesAsset.classic,
      name: "Rydr Classic",
      price: "2,200",
      time: "07: 38 pm",
      id: 2,
    ),
    RideModel(
      image: ImagesAsset.premium,
      name: "Rydr Premium",
      price: "3,200",
      time: "07: 38 pm",
      id: 1,
    ),
  ];
}
