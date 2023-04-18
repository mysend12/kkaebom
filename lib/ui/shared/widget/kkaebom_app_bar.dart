import 'package:flutter/material.dart';

class KkaebomAppBar extends StatelessWidget implements PreferredSizeWidget {
  KkaebomAppBar({
    Key? key,
    required this.title,
    this.isTitle = true,
    this.isProfileAction = true,
    this.elevation = 0.0,
  }) : super(key: key);

  String title;
  bool isTitle;
  bool isProfileAction;
  double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).unselectedWidgetColor,
        ),
        onPressed: () {
          print('click menu!!');
        },
      ),
      centerTitle: isTitle ? false : null,
      titleSpacing: 32,
      title: isTitle
          ? Text(
              '보호소 찾기',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).primaryColor),
            )
          : Container(),
      actions: [
        isProfileAction
            ? IconButton(
                onPressed: () {
                  print('click profile!!');
                },
                icon: Icon(
                  Icons.account_circle,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              )
            : Container(),
      ],
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
