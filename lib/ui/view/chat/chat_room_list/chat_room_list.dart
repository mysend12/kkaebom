import 'package:flutter/material.dart';

import '../../../shared/widget/navigation_bar.dart';
import 'widget/chat_room_cart.dart';

class ChatRoomList extends StatefulWidget {
  const ChatRoomList({Key? key}) : super(key: key);

  @override
  State<ChatRoomList> createState() => _ChatRoomListState();
}

class _ChatRoomListState extends State<ChatRoomList> {
  final GlobalKey _key = GlobalKey();
  double _height = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_setHeight);
  }

  void _setHeight(_) {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    setState(() {
      _height = MediaQuery.of(context).size.height -
          renderBox.localToGlobal(Offset.zero).dy -
          KkaebomNavigationBar.height;
    });
  }

  String _url =
      'https://ichef.bbci.co.uk/news/800/cpsprodpb/E172/production/_126241775_getty_cats.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      height: _height,
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
