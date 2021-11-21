import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:witch_hunt_flutter/drawer.dart';
import 'package:witch_hunt_flutter/models/phases.dart';
import 'package:witch_hunt_flutter/moderator_scripts.dart';
import 'package:witch_hunt_flutter/players_grid.dart';
import 'package:witch_hunt_flutter/providers/players_provider.dart';
import 'package:witch_hunt_flutter/reveal_black_cat.dart';

class BlackCatPhaseScreen extends StatefulWidget {
  const BlackCatPhaseScreen({Key? key}) : super(key: key);

  static const routeName = '/black-cat-phase';

  @override
  State<BlackCatPhaseScreen> createState() => _BlackCatPhaseScreenState();
}

class _BlackCatPhaseScreenState extends State<BlackCatPhaseScreen> {
  TextToSpeech tts = TextToSpeech();
  late PlayersProvider playersProvider;
  bool phaseStarted = false;
  bool phaseFinished = false;

  @override
  void initState() {
    super.initState();
    playersProvider = context.read<PlayersProvider>();
  }

  void startPhase() async {
    await speakStartBlackCat(tts);

    setState(() {
      phaseStarted = true;
    });
  }

  void endPhase() async {
    await speakEndScript(tts);

    setState(() {
      phaseFinished = true;
    });
  }

  void resetPhase() {
    setState(() {
      phaseFinished = false;
      phaseStarted = false;
    });

    playersProvider.resetBlackCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Black Cat Phase'),
      ),
      drawer: const MainDrawer(),
      body: phaseFinished
          ? const RevealDecision()
          : const PlayersGrid(phase: Phase.blackCat),
      floatingActionButton: FloatingActionButton(
        onPressed: phaseFinished
            ? resetPhase
            : phaseStarted
                ? endPhase
                : startPhase,
        tooltip: phaseFinished
            ? 'Reset phase'
            : phaseStarted
                ? 'Confirm choice'
                : 'Start night phase',
        child: Icon(phaseFinished
            ? CupertinoIcons.refresh_thick
            : phaseStarted
                ? Icons.check
                : Icons.play_arrow),
      ), // Thi
    );
  }
}
