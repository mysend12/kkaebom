import 'package:flutter/material.dart';

class KkaebomSafeWidget extends StatelessWidget {
  const KkaebomSafeWidget({
    Key? key,
    required this.child,
    this.physics = const NeverScrollableScrollPhysics(),
    this.horizontal = 16.0,
    this.vertical = 0.0,
  }) : super(key: key);
  final Widget child;
  final ScrollPhysics physics;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          physics: physics,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: vertical,
              horizontal: horizontal,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
