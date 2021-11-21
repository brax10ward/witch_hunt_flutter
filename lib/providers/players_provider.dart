import 'package:flutter/material.dart';
import 'package:witch_hunt_flutter/models/player.dart';

class PlayersProvider extends ChangeNotifier {
  List<Player> players = [
    Player(name: 'Braxton'),
    Player(name: 'Jessica'),
    Player(name: 'Cheryl'),
    Player(name: 'Layne'),
    Player(name: 'Levi'),
    Player(name: 'Aly'),
    Player(name: 'Kate'),
    Player(name: 'Steven'),
  ];

  void addPlayer(String playerName) {
    players.add(Player(name: playerName));
    notifyListeners();
  }

  void removePlayer(Player player) {
    players.removeWhere((element) => element.name == player.name);
    notifyListeners();
  }

  void toggleBlackCat(Player player) {
    if (players.any((p) => p.hasBlackCat && p.name != player.name)) {
      resetBlackCat();
    }

    player.hasBlackCat = !player.hasBlackCat;

    notifyListeners();
  }

  String blackCatPlayer() {
    return players
        .firstWhere(
          (element) => element.hasBlackCat,
          orElse: () => Player(name: 'No player has the black cat'),
        )
        .name;
  }

  void resetGame() {
    for (var element in players) {
      element.hasBlackCat = false;
      element.isKilled = false;
    }
  }

  void resetBlackCat() {
    for (var element in players) {
      element.hasBlackCat = false;
    }
  }
}
