import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:provider/provider.dart';

class KkaebomNavigationBar extends StatefulWidget {
  const KkaebomNavigationBar({Key? key, required tabIcons})
      : _tabIcons = tabIcons,
        super(key: key);
  static const int height = 58;
  final List<IconData> _tabIcons;

  @override
  State<KkaebomNavigationBar> createState() => _KkaebomNavigationBarState();
}

class _KkaebomNavigationBarState extends State<KkaebomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final sharedViewModel = context.watch<SharedViewModel>();

    return SizedBox(
      height: KkaebomNavigationBar.height.toDouble(),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: sharedViewModel.sharedState.bottomNavigationIndex,
        enableFeedback: false,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) {
          sharedViewModel.changeBottomNavigationIndex(index);
        },
        items: List.generate(
          widget._tabIcons.length,
          (index) => BottomNavigationBarItem(
              icon: Icon(widget._tabIcons[index]), label: '$index'),
        ),
      ),
    );
  }
}
