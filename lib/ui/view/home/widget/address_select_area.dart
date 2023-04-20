import 'package:flutter/material.dart';
import 'package:kkaebom/ui/view/home/widget/address_button.dart';

class AddressSelectArea extends StatelessWidget {
  AddressSelectArea({Key? key}) : super(key: key);

  List<String> title = [
    "서울특별시",
    "울산",
    "경기도 성남시",
    "인천광역시",
    "남대문",
    "부산광역시",
    "서울 강남구",
    "경기도 화천",
    "부산 서구",
    "서대문"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 10,
          children: List.generate(
            7,
            (index) => AddressButton(
              title: title[index],
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
