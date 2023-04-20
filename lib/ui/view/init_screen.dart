import 'package:flutter/material.dart';
import 'package:kkaebom/main2.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:kkaebom/ui/shared/widget/kkaebom_app_bar.dart';
import 'package:kkaebom/ui/shared/widget/kkaebom_navigation_bar.dart';
import 'package:kkaebom/ui/view/shelter/shelter_search/shelter_search.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatelessWidget {
  static String routeName = 'initScreen';
  InitScreen({Key? key}) : super(key: key);

  List<Widget> tabs = [
    const Home(),
    Container(),
    Main2(),
  ];

  List<String> titles = [
    '보호소 찾기',
    '미정',
    '임시 화면',
  ];

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = context.watch<SharedViewModel>();

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: KkaebomAppBar(
            title: titles[sharedViewModel.sharedState.bottomNavigationIndex],
            elevation: .4,
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: tabs[sharedViewModel.sharedState.bottomNavigationIndex],
            ),
          ),
          bottomNavigationBar: const KkaebomNavigationBar(),
        ),
      ),
    );
  }
}
