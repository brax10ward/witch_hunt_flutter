import 'package:flutter/material.dart';
import 'package:witch_hunt_flutter/drawer.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  static const routeName = '/rules';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rules'),
      ),
      drawer: const MainDrawer(),
    );
  }
}
