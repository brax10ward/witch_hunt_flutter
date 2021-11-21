import 'package:text_to_speech/text_to_speech.dart';

const String dawn = 'dawn';

const startBlackCat = [
  'All players close your eyes.',
  'Witches, please open your eyes and tap on any player to give the Black Cat. You may tap on yourself.'
];

Future<void> speakStartBlackCat(TextToSpeech tts) async {
  tts.speak(startBlackCat[0]);

  await Future.delayed(const Duration(seconds: 3));

  tts.speak(startBlackCat[1]);
}

const endScript = [
  'Witches, please close your eyes.',
  'Everyone, please open your eyes.'
];

Future<void> speakEndScript(TextToSpeech tts) async {
  tts.speak(endScript[0]);

  await Future.delayed(const Duration(seconds: 3));

  tts.speak(endScript[1]);
}
