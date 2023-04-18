import 'package:flutter/material.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:kkaebom/ui/view/home/home.dart';
import 'package:provider/provider.dart';

class Main2 extends StatelessWidget {
  const Main2({Key? key}) : super(key: key);

  static String routeName = "main2";

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = context.watch<SharedViewModel>();
    return Scaffold(
      body: ListView.builder(
        itemCount: BaseColors.values.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Home.routeName);
              },
              child: const Text('홈으로 이동'),
            );
          }
          return TextButton(
            onPressed: () {
              sharedViewModel.changeColor(BaseColors.values[index - 1]);
            },
            child: Text(BaseColors.values[index - 1].name),
          );
        },
      ),
    );
  }
}
