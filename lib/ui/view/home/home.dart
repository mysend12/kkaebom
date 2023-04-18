import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/widget/kkaebom_app_bar.dart';
import 'package:kkaebom/ui/view/home/widget/address_button.dart';
import 'package:kkaebom/ui/view/home/widget/shelter_search_bar.dart';

class Home extends StatefulWidget {
  static String routeName = "home";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  AddressButton(),
                  SizedBox(height: 20),
                  ShelterSearchBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
