import 'package:flutter/material.dart';
import 'package:kkaebom/ui/view/shelter/shelter_search/shelter_card_list.dart';
import 'package:kkaebom/ui/view/shelter/shelter_search/widget/address_button.dart';
import 'package:kkaebom/ui/view/shelter/shelter_search/widget/address_select_area.dart';
import 'package:kkaebom/ui/view/shelter/shelter_search/widget/shelter_search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool addressArea = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
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
            ),
          ),
        ),
      ),
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
