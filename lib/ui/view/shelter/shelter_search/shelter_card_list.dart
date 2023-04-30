import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:provider/provider.dart';

import '../../../shared/widget/navigation_bar.dart';
import 'widget/shelter_card.dart';

class ShelterCardList extends StatefulWidget {
  const ShelterCardList({Key? key}) : super(key: key);

  @override
  State<ShelterCardList> createState() => _ShelterCardListState();
}

class _ShelterCardListState extends State<ShelterCardList> {
  final GlobalKey _key = GlobalKey();
  double _height = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_setHeight);
  }

  void _setHeight(_) {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    setState(() {
      _height = MediaQuery.of(context).size.height -
          renderBox.localToGlobal(Offset.zero).dy -
          KkaebomNavigationBar.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    SharedViewModel sharedViewModel = context.watch<SharedViewModel>();
    return SizedBox(
      key: _key,
      height: _height,
      child: ListView.builder(
        itemBuilder: (_, index) {
          if (index == 10) {
            return SizedBox(height: sharedViewModel.sharedState.keyboardHeight);
          }
          return ShelterCard(
            index: index,
          );
        },
        itemCount: 11,
      ),
    );
  }
}
