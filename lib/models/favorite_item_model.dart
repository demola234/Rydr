
import 'package:rydr/utils/images_path.dart';

class FavoriteItems {
  String icon;
  String text;
  String time;

  FavoriteItems({
    required this.icon,
    required this.text,
    required this.time,
  });
}

List<FavoriteItems> favs = <FavoriteItems>[
  FavoriteItems(
    icon: ImagesAsset.home,
    text: "Home",
    time: "10 mins",
  ),
  FavoriteItems(
    icon: ImagesAsset.shop,
    text: "Shop",
    time: "16 mins",
  ),
  FavoriteItems(
    icon: ImagesAsset.hospital,
    text: "Hospital",
    time: "25 mins",
  ),
  FavoriteItems(
    icon: ImagesAsset.school,
    text: "School",
    time: "35 mins",
  ),
];

class FavoriteLists {
  int id;
  String icon;
  bool isSelected;

  FavoriteLists({
    required this.icon,
    this.isSelected = false,
    required this.id,
  });
}

class AppData {
  static List<FavoriteLists> favsitems = <FavoriteLists>[
    FavoriteLists(
      icon: ImagesAsset.home,
      id: 1,
      isSelected: true,
    ),
    FavoriteLists(
      icon: ImagesAsset.shop,
      id: 2,
    ),
    FavoriteLists(
      icon: ImagesAsset.hospital,
      id: 3,
    ),
    FavoriteLists(
      icon: ImagesAsset.bank,
      id: 4,
    ),
    FavoriteLists(
      icon: ImagesAsset.cars,
      id: 5,
    ),
    FavoriteLists(
      icon: ImagesAsset.bag,
      id: 6,
    ),
    FavoriteLists(
      icon: ImagesAsset.garage,
      id: 7,
    ),
    FavoriteLists(
      icon: ImagesAsset.game,
      id: 8,
    ),
  ];
}
