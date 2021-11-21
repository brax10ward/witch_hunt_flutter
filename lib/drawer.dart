import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:witch_hunt_flutter/providers/players_provider.dart';
import 'package:witch_hunt_flutter/screens/black_cat_phase_screen.dart';
import 'package:witch_hunt_flutter/screens/night_phase_screen.dart';
import 'package:witch_hunt_flutter/screens/players_screen.dart';
import 'package:witch_hunt_flutter/screens/rules.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.brown,
        child: ListView(
          children: [
            const SizedBox(height: 48),
            const MenuItem(
              icon: Icons.people,
              title: 'Players',
              routeName: PlayersScreen.routeName,
            ),
            const SizedBox(height: 16),
            const MenuItem(
              icon: Icons.person,
              title: 'Black Cat Phase',
              routeName: BlackCatPhaseScreen.routeName,
            ),
            const SizedBox(height: 16),
            const MenuItem(
              icon: Icons.nightlight,
              title: 'Night Phase',
              routeName: NightPhaseScreen.routeName,
            ),
            const SizedBox(height: 16),
            const MenuItem(
              icon: Icons.article_rounded,
              title: 'Rules',
              routeName: RulesScreen.routeName,
            ),
            const SizedBox(height: 200),
            const Divider(
              height: 1,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.refresh_bold),
              onTap: () {
                context.read<PlayersProvider>().resetGame();
                Navigator.of(context).pop();
              },
              title: const Text('New Game'),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.routeName,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      onTap: () => Navigator.of(context).popAndPushNamed(routeName),
      title: Text(title),
    );
  }
}
