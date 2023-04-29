import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/ui/view/chat/chat_list/chat_list.dart';

class ChatRoomCard extends StatelessWidget {
  ChatRoomCard({
    Key? key,
    required title,
    required int unReadCount,
    required lastMessageTime,
    required String lastMessage,
    required url,
  })  : _title = title,
        _unReadCount = unReadCount < 100 ? unReadCount : 99,
        _lastMessage = lastMessage,
        _lastMessageTime = lastMessageTime,
        _url = url,
        super(key: key);

  final String _title;
  final String _url;

  String _lastMessage;
  String _lastMessageTime;
  int _unReadCount = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatList()));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 24,
                top: 8,
                bottom: 8,
              ),
              child: CachedNetworkImage(
                imageUrl: _url,
                width: 64,
                height: 64,
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
            SizedBox(
              width: MediaQuery.of(context).size.width * .52,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    _lastMessage,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  child: Text(
                    _lastMessageTime,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 4),
                  child: _unReadCount <= 0
                      ? Container()
                      : CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          child: Text(
                            '$_unReadCount',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
