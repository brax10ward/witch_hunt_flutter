import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        actions: [
          IconButton(
            onPressed: FocusScope.of(context).unfocus,
            icon: const Icon(Icons.check),
          ),
        ],
        title: const Text('Players'),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              pinned: true,
              flexibleSpace: AddPlayerField(),
            )
          ];
        },
        body: ListView.builder(
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
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Add Player'),
        focusNode: focusNode,
        onFieldSubmitted: (String playerName) {
          if (playerName.isNotEmpty) {
            context.read<PlayersProvider>().addPlayer(playerName);
            controller.clear();
            focusNode.requestFocus();
          }
        },
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.send,
        showCursor: true,
      ),
    );
  }
}
