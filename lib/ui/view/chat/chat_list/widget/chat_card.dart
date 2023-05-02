import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/ui/view/gallery/image_detail/image_detail.dart';
import 'package:kkaebom/ui/view/gallery/video_player/video_player.dart';

import '../chat_type.dart';

class ChatCard extends StatelessWidget {
  ChatCard({
    Key? key,
    required int notReadCount,
    bool isMyChat = false,
    String? profileImageUrl,
    String? nickname,
    ChatType chatType = ChatType.TEXT,
    String? content,
    List<String>? images,
    String? vodLink,
    String? vodThumbnail,
  })  : _isMyChat = isMyChat,
        _notReadCount = notReadCount >= 100 ? 99 : notReadCount,
        _profileImageUrl = profileImageUrl,
        _nickname = nickname,
        _chatType = chatType,
        _content = content,
        _images = images,
        _vodLink = vodLink,
        _vodThumbnail = vodThumbnail,
        super(key: key);

  final bool _isMyChat;
  final int _notReadCount;
  final String? _profileImageUrl;
  final String? _nickname;

  final ChatType _chatType;
  final String? _content;
  String? _vodLink;
  String? _vodThumbnail;
  final List<String>? _images;

  @override
  Widget build(BuildContext context) {
    if (_chatType == ChatType.IMAGE && _vodLink == null) {
      _vodLink = _profileImageUrl;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment:
            _isMyChat ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!_isMyChat)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CachedNetworkImage(
                imageUrl: _profileImageUrl!,
                width: 32,
                height: 32,
                progressIndicatorBuilder: (_, url, download) {
                  if (download.progress != null) {
                    final percent = download.progress! * 100;
                    return Text(
                      'progress: $percent%',
                      style: Theme.of(context).textTheme.labelSmall,
                    );
                  }
                  return Center(
                    child: Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  );
                },
                imageBuilder: (_, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!_isMyChat)
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    _nickname!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_isMyChat)
                    Text(
                      '$_notReadCount',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  if (_isMyChat) const SizedBox(width: 10),
                  message(context),
                  if (!_isMyChat) const SizedBox(width: 10),
                  if (!_isMyChat)
                    Text(
                      '$_notReadCount',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget message(BuildContext context) {
    switch (_chatType) {
      case ChatType.TEXT:
        return textMessage(context);
      case ChatType.IMAGE:
        return imageMessage(context);
      case ChatType.VIDEO:
        return vodMessage(context);
    }
  }

  Widget textMessage(context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 10,
        minHeight: 10,
        maxWidth: MediaQuery.of(context).size.width * .6,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: _isMyChat
            ? Theme.of(context).colorScheme.secondaryContainer.withOpacity(.2)
            : Theme.of(context).colorScheme.background,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        _content!,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget imageMessage(context) {
    double bigImageSize = MediaQuery.of(context).size.width * .6 * .5;
    double smallImageSize = MediaQuery.of(context).size.width * .6 * .3333333;

    double imageSize = 0;
    int changeSizeIndex = -1;

    if (_images!.length == 1) {
      return singleImageMessage(context);
    } else if (_images!.length == 2) {
      imageSize = bigImageSize;
    } else if (_images!.length == 3) {
      imageSize = smallImageSize;
    } else if (_images!.length == 4) {
      imageSize = bigImageSize;
    } else {
      if (_images!.length % 3 == 1) {
        changeSizeIndex = _images!.length - 4;
      } else if (_images!.length % 3 == 2) {
        changeSizeIndex = _images!.length - 2;
      } else {
        imageSize = smallImageSize;
      }
    }
    return multiImageMessage(
      context,
      changeSizeIndex,
      imageSize,
      smallImageSize,
      bigImageSize,
    );
  }

  Widget singleImageMessage(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ImageDetail.routeName,
          arguments: {
            'id': 1,
            'images': _images!,
            'index': 0,
          },
        );
      },
      child: Align(
        alignment: _isMyChat ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          constraints: BoxConstraints(
            minWidth: 10,
            minHeight: 10,
            maxWidth: MediaQuery.of(context).size.width * .6,
            maxHeight: MediaQuery.of(context).size.height * .4,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              _images![0],
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget multiImageMessage(
    context,
    changeSizeIndex,
    imageSize,
    smallImageSize,
    bigImageSize,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 0,
        runSpacing: 0,
        children: List.generate(_images!.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ImageDetail.routeName,
                arguments: {
                  'id': 1,
                  'images': _images!,
                  'index': index,
                },
              );
            },
            child: SizedBox(
              width: changeSizeIndex == -1
                  ? imageSize
                  : index < changeSizeIndex
                      ? smallImageSize
                      : bigImageSize,
              height: changeSizeIndex == -1 ? imageSize : smallImageSize,
              child: Image.network(
                _images![index],
                fit: BoxFit.fill,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget vodMessage(context) {
    print(_vodLink);
    print(_vodThumbnail);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          KkaebomVideoPlayer.routeName,
          arguments: {
            'id': 1,
            'link': _vodLink!,
            'thumbnail': _vodThumbnail!,
          },
        );
      },
      child: SizedBox(
        width: 100,
        height: 100,
        child: Image.network(
          _vodThumbnail!,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
