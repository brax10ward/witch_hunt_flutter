import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:witch_hunt_flutter/providers/players_provider.dart';

class RevealDecision extends StatefulWidget {
  const RevealDecision({
    Key? key,
  }) : super(key: key);

  @override
  State<RevealDecision> createState() => _RevealDecisionState();
}

class _RevealDecisionState extends State<RevealDecision> {
  bool showDecision = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: showDecision
          ? AutoSizeText(
              context.read<PlayersProvider>().blackCatPlayer(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            )
          : TextButton(
              onPressed: () {
                setState(() {
                  showDecision = true;
                });
              },
              child: const Text('Reveal Decision')),
    );
  }
}
