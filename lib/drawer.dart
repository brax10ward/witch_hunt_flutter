import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          children: const [
            SizedBox(height: 48),
            MenuItem(
              icon: Icons.people,
              title: 'Players',
              routeName: PlayersScreen.routeName,
            ),
            SizedBox(height: 16),
            MenuItem(
              icon: Icons.person,
              title: 'Black Cat Phase',
              routeName: BlackCatPhaseScreen.routeName,
            ),
            SizedBox(height: 16),
            MenuItem(
              icon: Icons.nightlight,
              title: 'Night Phase',
              routeName: NightPhaseScreen.routeName,
            ),
            SizedBox(height: 16),
            MenuItem(
              icon: Icons.article_rounded,
              title: 'Rules',
              routeName: RulesScreen.routeName,
            ),
            SizedBox(height: 16),
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
