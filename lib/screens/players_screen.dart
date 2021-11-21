import 'package:flutter/material.dart';
import 'package:witch_hunt_flutter/drawer.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  static const routeName = '/players';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
      ),
      // body: ListView.builder(
      //   itemCount: 1,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ;
      //   },
      // ),
      drawer: const MainDrawer(),
    );
  }
}
