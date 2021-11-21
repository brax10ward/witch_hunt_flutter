import 'package:flutter/material.dart';
import 'package:witch_hunt_flutter/models/player.dart';

class PlayersProvider extends ChangeNotifier {
  List<Player> players = [];

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

  void toggleSave(Player player) {
    if (players.any((p) => p.isSaved && p.name != player.name)) {
      resetSave();
    }

    player.isSaved = !player.isSaved;

    notifyListeners();
  }

  void toggleKill(Player player) {
    if (players.any((p) => p.isKilled && p.name != player.name)) {
      resetKill();
    }

    player.isKilled = !player.isKilled;

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

  String savedPlayer() {
    return players
        .firstWhere(
          (element) => element.isSaved,
          orElse: () => Player(name: 'No player was saved :('),
        )
        .name;
  }

  String killedPlayer() {
    return players
        .firstWhere(
          (element) => element.isKilled,
          orElse: () => Player(name: 'No player was killed :('),
        )
        .name;
  }

  void markPlayerOut() {
    final Player player = players.firstWhere((p) => p.isKilled);

    player.isOut = true;
    notifyListeners();
  }

  void resetGame() {
    for (var element in players) {
      element.hasBlackCat = false;
      element.isKilled = false;
      element.isOut = false;
    }
  }

  void resetBlackCat() {
    for (var element in players) {
      element.hasBlackCat = false;
    }
  }

  void resetNight() {
    resetSave();
    resetKill();
  }

  void resetSave() {
    for (var element in players) {
      element.isSaved = false;
    }
  }

  void resetKill() {
    for (var element in players) {
      element.isKilled = false;
    }
  }
}
