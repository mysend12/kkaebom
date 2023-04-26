import 'package:flutter/material.dart';

class KkaebomAppBar extends StatelessWidget implements PreferredSizeWidget {
  KkaebomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.elevation = 0.4,
    this.actions,
  }) : super(key: key);

  String? title;
  double elevation;
  Widget? leading;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      centerTitle: actions == null ? null : false,
      titleSpacing: 32,
      title: title == null
          ? Container()
          : Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
      actions: actions,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
