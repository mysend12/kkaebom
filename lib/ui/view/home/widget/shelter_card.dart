import 'package:flutter/material.dart';

class ShelterCard extends StatelessWidget {
  ShelterCard({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
      ),
      child: Row(
        children: [
          Text('$index'),
        ],
      ),
    );
  }
}
