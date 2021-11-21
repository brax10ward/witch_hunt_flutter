import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:witch_hunt_flutter/drawer.dart';
import 'package:witch_hunt_flutter/moderator_scripts.dart';
import 'package:witch_hunt_flutter/screens/black_cat_phase_screen.dart';
import 'package:witch_hunt_flutter/screens/night_phase_screen.dart';
import 'package:witch_hunt_flutter/screens/players_screen.dart';
import 'package:witch_hunt_flutter/screens/rules.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
      routes: {
        BlackCatPhaseScreen.routeName: (context) => const BlackCatPhaseScreen(),
        NightPhaseScreen.routeName: (context) => const NightPhaseScreen(),
        PlayersScreen.routeName: (context) => const PlayersScreen(),
        RulesScreen.routeName: (context) => const RulesScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salem 1692'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ready to hunt for some witches?",
              style: Theme.of(context).textTheme.headline6,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(PlayersScreen.routeName),
              child: const Text('Add Players'),
            ),
          ],
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
