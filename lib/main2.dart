import 'package:flutter/material.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:kkaebom/ui/shared/widget/navigation_bar.dart';
import 'package:provider/provider.dart';

class Main2 extends StatefulWidget {
  Main2({Key? key}) : super(key: key);

  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  final GlobalKey globalKey = GlobalKey();
  double _height = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_setHeight);
  }

  void _setHeight(_) {
    final renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
    setState(() {
      _height = MediaQuery.of(context).size.height -
          renderBox.localToGlobal(Offset.zero).dy - KkaebomNavigationBar.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = context.watch<SharedViewModel>();

    return SizedBox(
      key: globalKey,
      height: _height,
      child: ListView.builder(
        itemCount: BaseColors.values.length,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () {
              sharedViewModel.changeColor(BaseColors.values[index]);
            },
            child: Text(BaseColors.values[index].name),
          );
        },
      ),
    );
  }
}
