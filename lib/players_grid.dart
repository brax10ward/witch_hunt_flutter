import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:witch_hunt_flutter/models/phases.dart';
import 'package:witch_hunt_flutter/models/player.dart';
import 'package:witch_hunt_flutter/providers/players_provider.dart';

class PlayersGrid extends StatelessWidget {
  const PlayersGrid({
    Key? key,
    required this.phase,
  }) : super(key: key);

  final Phase phase;

  @override
  Widget build(BuildContext context) {
    final List<Player> players = context.watch<PlayersProvider>().players;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: players.length,
      itemBuilder: (BuildContext context, int index) {
        final Player player = players[index];
        return Padding(
          padding: const EdgeInsets.all(1.5),
          child: InkWell(
            onTap: () {
              switch (phase) {
                case Phase.blackCat:
                  context.read<PlayersProvider>().toggleBlackCat(player);
                  break;
                case Phase.kill:
                  // TODO: Handle this case.
                  break;
                case Phase.save:
                  // TODO: Handle this case.
                  break;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: player.hasBlackCat
                    ? Colors.red.shade300
                    : Colors.brown.shade300,
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: AutoSizeText(
                  player.name,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
