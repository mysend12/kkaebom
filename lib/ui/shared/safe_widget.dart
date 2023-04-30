import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/widget/app_bar.dart';

import 'widget/navigation_bar.dart';

class KkaebomSafeWidget extends StatelessWidget {
  KkaebomSafeWidget({
    Key? key,
    required this.child,
    required this.appBar,
    this.reverse = false,
    this.bottomNavigationBar,
    this.physics = const NeverScrollableScrollPhysics(),
    this.horizontal = 16.0,
    this.vertical = 0.0,
  }) : super(key: key);
  final Widget child;
  final ScrollPhysics physics;
  final double horizontal;
  final double vertical;
  final KkaebomAppBar appBar;
  final KkaebomNavigationBar? bottomNavigationBar;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: appBar,
          body: SingleChildScrollView(
            reverse: reverse,
            physics: physics,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: vertical,
                horizontal: horizontal,
              ),
              child: child,
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
