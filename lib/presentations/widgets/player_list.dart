import 'package:flutter/material.dart';

class PlayerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: 5, // プレイヤーの数
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Player ${index + 1}'),
          );
        },
      ),
    );
  }
}
