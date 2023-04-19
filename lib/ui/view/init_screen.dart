import 'package:flutter/material.dart';
import 'package:kkaebom/main2.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:kkaebom/ui/shared/widget/kkaebom_app_bar.dart';
import 'package:kkaebom/ui/shared/widget/kkaebom_navigation_bar.dart';
import 'package:kkaebom/ui/view/home/home.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatelessWidget {
  static String routeName = 'initScreen';
  InitScreen({Key? key}) : super(key: key);

  List<Widget> widgets = [
    const Home(),
    Container(),
    Main2(),
  ];

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = context.watch<SharedViewModel>();

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: KkaebomAppBar(
            title: '보호소 찾기',
            elevation: .4,
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: widgets[sharedViewModel.sharedState.bottomNavigationIndex],
            ),
          ),
          bottomNavigationBar: const KkaebomNavigationBar(),
        ),
      ),
    );
  }
}
