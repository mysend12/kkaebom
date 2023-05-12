import 'package:flutter/material.dart';

import '../../../shared/widget/navigation_bar.dart';
import '../../../shared/widget_size_calculator.dart';
import 'widget/chat_room_cart.dart';

class ChatRoomList extends StatefulWidget {
  const ChatRoomList({Key? key}) : super(key: key);

  @override
  WidgetSizeCalculator<ChatRoomList> createState() => _ChatRoomListState();
}

class _ChatRoomListState extends WidgetSizeCalculator<ChatRoomList> {
  String _url =
      'https://ichef.bbci.co.uk/news/800/cpsprodpb/E172/production/_126241775_getty_cats.png';

  @override
  void initState() {
    initBottomWidgetHeight(KkaebomNavigationBar.height.toDouble());
    super.initState();
  }

  @override
  Widget builder(BuildContext context) {
    return SizedBox(
      key: key,
      height: height,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return ChatRoomCard(
            title: '제목제목제목제',
            url: _url,
            lastMessage: '마지막 메시지입니다마지막 메시지입니다마지막 메시지입니다마지막 메시지입니다마지막 메시지입니다마지막 메시지입니다마지막 메시지입니다',
            lastMessageTime: '오후 08:00',
            unReadCount: index + ((index - 1) * 10),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
