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
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.primary.withOpacity(.5),
      ),
      titleTextStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.primary),
      leading: leading,
      centerTitle: actions == null ? null : false,
      title: title == null ? Container() : Text(title!),
      actions: actions,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
