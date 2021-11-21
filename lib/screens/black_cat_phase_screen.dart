import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:witch_hunt_flutter/drawer.dart';
import 'package:witch_hunt_flutter/moderator_scripts.dart';

class BlackCatPhaseScreen extends StatefulWidget {
  const BlackCatPhaseScreen({Key? key}) : super(key: key);

  static const routeName = '/black-cat-phase';

  @override
  State<BlackCatPhaseScreen> createState() => _BlackCatPhaseScreenState();
}

class _BlackCatPhaseScreenState extends State<BlackCatPhaseScreen> {
  TextToSpeech tts = TextToSpeech();

  void dawnPhase() async {
    for (var script in dawnScript.keys) {
      final Duration? duration = dawnScript[script];
      await tts.speak(script);

      if (duration != null) {
        await Future.delayed(duration);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Black Cat Phase'),
      ),
      drawer: const MainDrawer(),

      floatingActionButton: FloatingActionButton(
        onPressed: dawnPhase,
        tooltip: 'Start night phase',
        child: const Icon(Icons.play_arrow),
      ), // Thi
    );
  }
}
