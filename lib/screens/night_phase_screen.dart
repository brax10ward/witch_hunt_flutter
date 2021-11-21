import 'package:flutter/material.dart';
import 'package:witch_hunt_flutter/drawer.dart';

class NightPhaseScreen extends StatelessWidget {
  const NightPhaseScreen({Key? key}) : super(key: key);

  static const routeName = '/night-phase';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Night Phase'),
      ),
      drawer: const MainDrawer(),
    );
  }
}
