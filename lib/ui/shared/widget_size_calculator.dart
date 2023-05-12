import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:provider/provider.dart';

import 'widget/navigation_bar.dart';

abstract class WidgetSizeCalculator<T extends StatefulWidget> extends State<T>
    with Diagnosticable, WidgetsBindingObserver {
  late SharedViewModel sharedViewModel;
  final GlobalKey key = GlobalKey();
  double height = 0;
  double _bottomWidgetHeight = 0;

  void initBottomWidgetHeight(double bottomWidgetHeight) {
    _bottomWidgetHeight = bottomWidgetHeight;
  }

  void setHeight({double? bottomWidgetHeight}) {
    _bottomWidgetHeight = bottomWidgetHeight ?? _bottomWidgetHeight;

    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    setState(() => height = MediaQuery.of(context).size.height -
        renderBox.localToGlobal(Offset.zero).dy -
        _bottomWidgetHeight);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (mounted) {
      final bottomInset = MediaQuery.of(context).viewInsets.bottom
          - KkaebomNavigationBar.height;
      sharedViewModel.setKeyboardHeight(bottomInset);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setHeight());
  }

  @override
  Widget build(BuildContext context) {
    sharedViewModel = context.watch<SharedViewModel>();
    setHeight();
    return builder(context);
  }

  Widget builder(BuildContext context);
}
