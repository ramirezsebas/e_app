import 'package:e_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class EAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EAppBar({
    required this.title,
    required this.onDrawerTap,
    this.leading,
    this.body,
    super.key,
  });

  final Widget title;
  final Widget? leading;
  final Widget? body;
  final VoidCallback onDrawerTap;

  static const _height = 300.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            onPressed: onDrawerTap,
            icon: Assets.icons.drawer.image(),
          ),
        ),
      ],
      leading: leading,
      automaticallyImplyLeading: false,
      title: title,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(_height),
        child: body ?? const SizedBox(),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xffF00E51),
              Color(0xffFF6720),
              Color(0xffFF9E1B),
            ],
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
