class TripRating {
  int id;
  String emoji;

  bool isSelected;

  TripRating({
    required this.id,
    required this.emoji,
    this.isSelected = false,
  });
}

class RatingData {
  static List<TripRating> rideDetails = <TripRating>[
    TripRating(
      emoji: "😡",
      isSelected: false,
      id: 1,
    ),
    TripRating(
      emoji: "😠",
      id: 2,
    ),
    TripRating(
      emoji: "🙁",
      id: 3,
    ),
    TripRating(
      emoji: "😌",
      id: 4,
    ),
    TripRating(
      emoji: "😁",
      id: 5,
    ),
  ];
}
