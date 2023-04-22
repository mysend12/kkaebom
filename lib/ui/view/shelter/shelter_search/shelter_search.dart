import 'package:flutter/material.dart';

import 'shelter_card_list.dart';
import 'widget/address_button.dart';
import 'widget/address_select_area.dart';
import 'widget/shelter_search_bar.dart';

class ShelterSearch extends StatefulWidget {
  const ShelterSearch({Key? key}) : super(key: key);

  @override
  State<ShelterSearch> createState() => _ShelterSearchState();
}

class _ShelterSearchState extends State<ShelterSearch> {
  bool addressArea = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AddressButton(
            title: '경기도 성남시',
            isArrowButton: true,
            onPressed: () => showAddressList(context),
          ),
        ),
        const SizedBox(height: 8),
        const ShelterSearchBar(),
        const SizedBox(height: 16),
        const ShelterCardList(),
      ],
    );
  }

  void showAddressList(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddressSelectArea();
      },
    );
  }
}
