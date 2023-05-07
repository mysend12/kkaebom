import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/safe_widget.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:kkaebom/ui/view/chat/chat_list/chat_type.dart';
import 'package:kkaebom/ui/view/chat/chat_list/widget/chat_card.dart';
import 'package:provider/provider.dart';

import '../../../shared/widget/app_bar.dart';
import 'widget/chat_input_bar.dart';

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
    WidgetsBinding.instance.addPostFrameCallback(_setChat);
    WidgetsBinding.instance.addPostFrameCallback(_setPosition);
  }

  void _setHeight(_) {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    setState(() {
      _height = MediaQuery.of(context).size.height -
          renderBox.localToGlobal(Offset.zero).dy -
          50;
    });
  }

  void _setChat(_) {
    var random = Random();
    int length = random.nextInt(100);
    length = length < 40 ? 40 : length;

    var min = 0x21; //start ascii  사용할 아스키 문자의 시작
    var max = 0x7A; //end ascii    사용할 아스키 문자의 끝

    for (int index = 0; index < length; index++) {
      int contentLength = random.nextInt(1000);
      String content = '';
      for (int index = 0; index < contentLength; index++) {
        content += String.fromCharCode(min + random.nextInt(max - min));
      }

      int typeIndex = random.nextInt(10);
      ChatType type = ChatType.TEXT;
      if (typeIndex < 5) {
        type = ChatType.IMAGE;
      } else if (typeIndex > 8) {
        type = ChatType.VIDEO;
      }

      List<String> images = [];
      if (type == ChatType.IMAGE) {
        if (typeIndex < 2) {
          for (int i = 0; i < random.nextInt(20); i++) {
            if (random.nextBool()) {
              images.add(_url);
            } else {
              images.add(_url2);
            }
          }
        } else {
          images.add(random.nextBool() ? _url : _url2);
        }
      }

      bool isMyChat = random.nextBool();

      chatList.add(
        ChatCard(
          notReadCount: random.nextInt(120),
          profileImageUrl: _url,
          isMyChat: isMyChat,
          nickname: isMyChat ? null : 'nickname$index',
          content: content,
          chatType: type,
          vodLink: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          vodThumbnail: _url,
          images: images,
        ),
      );
    }
  }

  void _setPosition(_) {
    if (scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100)).then((value) {
        final position = scrollController.position.maxScrollExtent + 1000;
        scrollController.jumpTo(position);
      });
    }
  }

  TextEditingController chatInputController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<ChatCard> chatList = [];

  @override
  Widget build(BuildContext context) {
    SharedViewModel sharedViewModel = context.watch<SharedViewModel>();
    return KkaebomSafeWidget(
      reverse: true,
      horizontal: 0,
      appBar: KkaebomAppBar(
        title: '$title$number',
        actions: [
          IconButton(
            onPressed: () {
              print('click chat search');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('click menu');
            },
            icon: const Icon(Icons.menu),
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
              controller: scrollController,
              itemBuilder: (_, index) {
                if (index == 0) {
                  return SizedBox(height: sharedViewModel.sharedState.keyboardHeight);
                }

                return chatList[index - 1];
              },
              itemCount: chatList.length + 1,
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
