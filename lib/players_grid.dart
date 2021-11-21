import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
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
    final PlayersProvider playersProvider = context.read<PlayersProvider>();
    final List<Player> players = context.watch<PlayersProvider>().players;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: players.length,
      itemBuilder: (BuildContext context, int index) {
        final Player player = players[index];
        late Color color;
        switch (phase) {
          case Phase.blackCat:
            color = player.hasBlackCat
                ? Colors.red.shade300
                : Colors.brown.shade300;
            break;
          case Phase.kill:
            color =
                player.isKilled ? Colors.red.shade300 : Colors.brown.shade300;
            break;
          case Phase.save:
            color =
                player.isSaved ? Colors.green.shade300 : Colors.red.shade300;
            break;
        }

        return Padding(
          padding: const EdgeInsets.all(1.5),
          child: InkWell(
            onTap: () {
              if (player.isOut) {
                return;
              }

              switch (phase) {
                case Phase.blackCat:
                  playersProvider.toggleBlackCat(player);
                  break;
                case Phase.kill:
                  playersProvider.toggleKill(player);
                  break;
                case Phase.save:
                  playersProvider.toggleSave(player);
                  break;
              }
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    color: color,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: AutoSizeText(
                          player.name,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 50),
                        ),
                      ),
                      if (player.isOut) ...[
                        LayoutBuilder(
                          builder: (
                            BuildContext context,
                            BoxConstraints constraints,
                          ) {
                            return Icon(
                              CupertinoIcons.xmark,
                              color: Colors.red.shade300,
                              size: constraints.maxHeight,
                            );
                          },
                        ),
                      ]
                    ],
                  ),
                ),
                if (player.isOut)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54,
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
