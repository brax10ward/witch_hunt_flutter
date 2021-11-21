import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:witch_hunt_flutter/drawer.dart';
import 'package:witch_hunt_flutter/models/player.dart';
import 'package:witch_hunt_flutter/providers/players_provider.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  static const routeName = '/players';

  @override
  Widget build(BuildContext context) {
    final List<Player> players = context.watch<PlayersProvider>().players;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Players'),
      ),
      body: Column(
        children: [
          const AddPlayerField(),
          ListView.builder(
            itemCount: players.length,
            itemBuilder: (BuildContext context, int index) {
              final Player player = players[index];
              return ListTile(
                title: Text(player.name),
                trailing: IconButton(
                  onPressed: () =>
                      context.read<PlayersProvider>().removePlayer(player),
                  icon: const Icon(CupertinoIcons.xmark_circle_fill),
                ),
              );
            },
            shrinkWrap: true,
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}

class AddPlayerField extends StatefulWidget {
  const AddPlayerField({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPlayerField> createState() => _AddPlayerFieldState();
}

class _AddPlayerFieldState extends State<AddPlayerField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Add Player'),
        onFieldSubmitted: (String playerName) {
          context.read<PlayersProvider>().addPlayer(playerName);
          controller.clear();
        },
      ),
    );
  }
}
