import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class KkaebomVideoPlayer extends StatefulWidget {
  const KkaebomVideoPlayer({Key? key}) : super(key: key);
  static const routeName = 'kkaebomVideoPlayer';

  @override
  State<KkaebomVideoPlayer> createState() => _KkaebomVideoPlayerState();
}

class _KkaebomVideoPlayerState extends State<KkaebomVideoPlayer> {
  late final VideoPlayerController _controller;

  late bool initLink = false;
  late final String link;
  late final String thumbnail;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!initLink) {
      final Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      link = args['link'];
      thumbnail = args['thumbnail'];
      initLink = true;

      _controller = VideoPlayerController.network(link)
        ..initialize().then((value) => setState(() {}));
      _controller.play();
    }

    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? GestureDetector(
          onTap: () {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          },
              child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
            )
            : Container(),
      ),
    );
  }
}
