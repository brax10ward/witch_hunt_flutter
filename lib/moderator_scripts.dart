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

const endBlackCat = [
  'Witches, please close your eyes.',
  'Everyone, please open your eyes.'
];

Future<void> speakEndBlackCat(TextToSpeech tts) async {
  tts.speak(endBlackCat[0]);

  await Future.delayed(const Duration(seconds: 3));

  tts.speak(endBlackCat[1]);
}

const startNightPhase = [
  'All players close your eyes.',
  'If you have a Witch card, or ever had a Witch card, please open your eyes and tap any player to Kill. You may select yourself.',
];

Future<void> speakStartNightPhase(TextToSpeech tts) async {
  tts.speak(startNightPhase[0]);

  await Future.delayed(const Duration(seconds: 3));

  tts.speak(startNightPhase[1]);
}

const endNightWitchPhase = 'Witches, please close your eyes.';
Future<void> speakEndNightWitchPhase(TextToSpeech tts) async {
  tts.speak(endNightWitchPhase);

  await Future.delayed(const Duration(seconds: 3));
}

const constableStart =
    'Constable, please open your eyes and tap any player to save. You may not save yourself.';
Future<void> speakStartConstablePhase(TextToSpeech tts) async {
  tts.speak(constableStart);

  await Future.delayed(const Duration(seconds: 3));
}

const constableEnd = 'Constable, please close your eyes.';
const nightEnd = 'Everyone, open your eyes. Confess before the timer runs out!';

Future<void> speakEndNightPhase(TextToSpeech tts) async {
  tts.speak(constableEnd);

  await Future.delayed(const Duration(seconds: 3));

  tts.speak(nightEnd);

  await Future.delayed(const Duration(seconds: 3));
}
