import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/widget/kkaebom_navigation_bar.dart';
import 'package:kkaebom/ui/view/home/widget/shelter_card.dart';

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
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    setState(() {
      _height = MediaQuery.of(context).size.height -
          renderBox.localToGlobal(Offset.zero).dy -
          KkaebomNavigationBar.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      height: _height,
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
