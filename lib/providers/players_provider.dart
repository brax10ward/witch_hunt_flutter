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
}
