import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/safe_widget.dart';
import 'package:provider/provider.dart';

import '../../main2.dart';
import '../shared/shared_view_model.dart';
import '../shared/widget/app_bar.dart';
import '../shared/widget/navigation_bar.dart';
import 'chat/chat_room_list/chat_room_list.dart';
import 'shelter/shelter_search/shelter_search.dart';

class InitScreen extends StatelessWidget {
  static String routeName = 'initScreen';

  InitScreen({Key? key}) : super(key: key);

  final List<Widget> _tabs = [
    const ShelterSearch(),
    const ChatRoomList(),
    Main2(),
  ];

  final List<IconData> _tabIcons = [
    Icons.other_houses_outlined,
    Icons.chat_rounded,
    Icons.add
  ];

  final List<String> _titles = [
    '보호소 찾기',
    '채팅',
    '임시 화면',
  ];

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = context.watch<SharedViewModel>();

    late final List<Widget?> leadings = [
      IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          print('click menu!!');
        },
      ),
      null,
      null,
    ];

    late final List<List<Widget>?> actions = [
      [
        IconButton(
          onPressed: () {
            print('click profile!!');
          },
          icon: Icon(
            Icons.account_circle,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 16),
      ],
      [
        IconButton(
          onPressed: () { print('click search!!'); },
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        IconButton(
          onPressed: () { print('click setting!!'); },
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 16),
      ],
      null
    ];

    return KkaebomSafeWidget(
      appBar: KkaebomAppBar(
        title: _titles[sharedViewModel.sharedState.bottomNavigationIndex],
        elevation: .4,
        actions: actions[sharedViewModel.sharedState.bottomNavigationIndex],
        leading:
            leadings[sharedViewModel.sharedState.bottomNavigationIndex],
      ),
      physics: const NeverScrollableScrollPhysics(),
      vertical: 0,
      horizontal: 16,
      bottomNavigationBar: KkaebomNavigationBar(
        tabIcons: _tabIcons,
      ),
      child: _tabs[sharedViewModel.sharedState.bottomNavigationIndex],
    );
  }
}
