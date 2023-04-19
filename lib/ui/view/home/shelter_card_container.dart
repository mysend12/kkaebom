import 'package:flutter/material.dart';
import 'package:kkaebom/ui/view/home/widget/shelter_card.dart';

class ShelterCardContainer extends StatelessWidget {
  const ShelterCardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return ShelterCard(
            index: index,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
