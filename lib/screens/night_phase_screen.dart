import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:witch_hunt_flutter/drawer.dart';
import 'package:witch_hunt_flutter/models/phases.dart';
import 'package:witch_hunt_flutter/moderator_scripts.dart';
import 'package:witch_hunt_flutter/players_grid.dart';
import 'package:witch_hunt_flutter/providers/players_provider.dart';

class NightPhaseScreen extends StatefulWidget {
  const NightPhaseScreen({Key? key}) : super(key: key);

  static const routeName = '/night-phase';

  @override
  State<NightPhaseScreen> createState() => _NightPhaseScreenState();
}

class _NightPhaseScreenState extends State<NightPhaseScreen> {
  TextToSpeech tts = TextToSpeech();
  late PlayersProvider playersProvider;
  bool killPhaseStarted = false;
  bool constablePhaseStarted = false;
  bool phaseFinished = false;

  @override
  void initState() {
    super.initState();
    playersProvider = context.read<PlayersProvider>();
  }

  void startPhase() async {
    await speakStartNightPhase(tts);

    setState(() {
      killPhaseStarted = true;
    });
  }

  void endPhase() async {
    if (constablePhaseStarted) {
      setState(() {
        phaseFinished = true;
      });

      await speakEndNightPhase(tts);
    } else {
      setState(() {
        constablePhaseStarted = true;
      });
      await speakEndNightWitchPhase(tts);
      await speakStartConstablePhase(tts);
    }
  }

  void resetPhase() {
    setState(() {
      phaseFinished = false;
      constablePhaseStarted = false;
      killPhaseStarted = false;
    });

    playersProvider.resetNight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Night Phase'),
      ),
      drawer: const MainDrawer(),
      body: phaseFinished
          ? const NightPhaseDecision()
          : PlayersGrid(phase: constablePhaseStarted ? Phase.save : Phase.kill),
      floatingActionButton: FloatingActionButton(
        onPressed: phaseFinished
            ? resetPhase
            : killPhaseStarted
                ? endPhase
                : startPhase,
        tooltip: phaseFinished
            ? 'Reset phase'
            : killPhaseStarted
                ? 'Confirm choice'
                : 'Start night phase',
        child: Icon(
          phaseFinished
              ? CupertinoIcons.refresh_thick
              : killPhaseStarted
                  ? Icons.check
                  : Icons.play_arrow,
        ),
      ),
    );
  }
}

class NightPhaseDecision extends StatelessWidget {
  const NightPhaseDecision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Duration timer = Duration(seconds: 5);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              AutoSizeText(
                'The Constable saved:',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              AutoSizeText(
                context.read<PlayersProvider>().savedPlayer(),
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              AutoSizeText(
                'Time left to confess:',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              TweenAnimationBuilder<Duration>(
                duration: timer,
                tween: Tween(begin: timer, end: Duration.zero),
                onEnd: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const PlayerKilledDialog();
                    },
                  );
                },
                builder: (BuildContext context, Duration value, Widget? child) {
                  final seconds = value.inSeconds % 60;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '$seconds seconds',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlayerKilledDialog extends StatelessWidget {
  const PlayerKilledDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayersProvider playersProvider = context.read<PlayersProvider>();

    return AlertDialog(
      title: const Text('The witches tried to kill:'),
      content: Text(
        context.read<PlayersProvider>().killedPlayer(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            playersProvider.resetNight();
            Navigator.of(context).pop();
          },
          child: const Text('They are saved!'),
        ),
        TextButton(
          onPressed: () {
            playersProvider.markPlayerOut();
            playersProvider.resetNight();

            Navigator.of(context).pop();
          },
          child: const Text('They are dead!'),
        ),
      ],
    );
  }
}
