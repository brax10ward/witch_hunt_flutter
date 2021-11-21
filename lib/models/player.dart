class Player {
  final String name;
  bool hasBlackCat;
  bool isKilled;
  bool isSaved;
  bool isOut;

  Player({
    required this.name,
    this.hasBlackCat = false,
    this.isKilled = false,
    this.isSaved = false,
    this.isOut = false,
  });
}
