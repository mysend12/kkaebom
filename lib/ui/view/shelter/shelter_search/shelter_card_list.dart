import 'package:flutter/material.dart';
import 'package:kkaebom/domain/shelter/model/shelter.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:provider/provider.dart';

import '../../../shared/widget/navigation_bar.dart';
import '../../../shared/widget_size_calculator.dart';
import 'widget/shelter_card.dart';

class ShelterCardList extends StatefulWidget {
  const ShelterCardList({Key? key}) : super(key: key);

  @override
  WidgetSizeCalculator<ShelterCardList> createState() => _ShelterCardListState();
}

class _ShelterCardListState extends WidgetSizeCalculator<ShelterCardList> {
  String _url =
      'https://ichef.bbci.co.uk/news/800/cpsprodpb/E172/production/_126241775_getty_cats.png';

  @override
  void initState() {
    initBottomWidgetHeight(KkaebomNavigationBar.height.toDouble());
    super.initState();
  }

  @override
  Widget builder(BuildContext context) {
    SharedViewModel sharedViewModel = context.watch<SharedViewModel>();

    return SizedBox(
      key: key,
      height: height,
      child: ListView.builder(
        itemBuilder: (_, index) {
          if (index == 10) {
            return SizedBox(height: sharedViewModel.sharedState.keyboardHeight);
          }
          return ShelterCard(
            shelter: Shelter(
              id: index,
              title: 'title $index',
              imageUrl: _url,
              adminId: 1
            ),
          );
        },
        itemCount: 11,
      ),
    );
  }
}
