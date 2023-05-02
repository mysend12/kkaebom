import 'package:flutter/material.dart';
import 'package:kkaebom/ui/view/gallery/image_detail/image_detail.dart';
import 'package:kkaebom/ui/view/gallery/video_player/video_player.dart';

import '../view/init_screen.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    InitScreen.routeName: (ctx) => InitScreen(),
    ImageDetail.routeName: (ctx) => ImageDetail(),
    KkaebomVideoPlayer.routeName: (ctx) => KkaebomVideoPlayer(),
  };
}