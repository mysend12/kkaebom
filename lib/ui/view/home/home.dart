import 'package:flutter/material.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = context.watch<SharedViewModel>();

    return SafeArea(
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
