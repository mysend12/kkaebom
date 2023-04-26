import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/safe_widget.dart';
import 'package:kkaebom/ui/view/chat/chat_list/chat_type.dart';
import 'package:kkaebom/ui/view/chat/chat_list/widget/chat_card.dart';

import '../../../shared/widget/app_bar.dart';
import 'widget/ChatInputBar.dart';

class ChatList extends StatefulWidget {
  static String routeName = 'chatList';

  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  String _url =
      'https://ichef.bbci.co.uk/news/800/cpsprodpb/E172/production/_126241775_getty_cats.png';

  String _url2 =
      'https://static01.nyt.com/images/2016/03/30/universal/ko/well_cat-korean/well_cat-articleLarge-v2.jpg?quality=75&auto=webp&disable=upscale';
  final GlobalKey _key = GlobalKey();
  double _height = 0;

  String title = 'title';
  int number = 2;

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
          80;
    });
  }

  TextEditingController chatInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KkaebomSafeWidget(
      horizontal: 0,
      appBar: KkaebomAppBar(
        title: '$title$number',
        actions: [
          IconButton(
            onPressed: () {
              print('click chat search');
            },
            icon: const Icon(Icons.search),
            color: Theme.of(context).colorScheme.primary,
          ),
          IconButton(
            onPressed: () {
              print('click menu');
            },
            icon: Icon(Icons.menu),
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      child: Column(
        key: _key,
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
            height: _height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemBuilder: (_, index) {
                var random = Random();
                int contentLength = random.nextInt(1000);
                var min = 0x21; //start ascii  사용할 아스키 문자의 시작
                var max = 0x7A; //end ascii    사용할 아스키 문자의 끝

                String content = '';
                for (int index = 0; index < contentLength; index++) {
                  content +=
                      String.fromCharCode(min + random.nextInt(max - min));
                }

                return ChatCard(
                  notReadCount: random.nextInt(120),
                  profileImageUrl: _url,
                  isMyChat: index == 3,
                  nickname: index == 3 ? null : 'nickname$index',
                  content: content,
                  chatType: index == 2 || index == 8
                      ? ChatType.IMAGE
                      : index == 4
                          ? ChatType.IMAGE_LIST
                          : ChatType.TEXT,
                  fileLink: index == 8 ? _url2 : null,
                  images: [
                    _url,
                    _url2,
                    _url,
                    _url2,
                    _url,
                    _url2,
                    _url,
                    _url2,
                    _url,
                    _url2
                  ],
                );
              },
              itemCount: 10,
            ),
          ),
          ChatInputBar(
            chatInputController: chatInputController,
          ),
        ],
      ),
    );
  }
}
