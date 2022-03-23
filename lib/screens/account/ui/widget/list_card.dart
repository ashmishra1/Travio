import 'package:flutter/material.dart';
import 'package:travio/utils/widgets/box_text.dart';

class ListCard extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onTap;
  const ListCard({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: 20.0,
      minLeadingWidth: 10.0,
      leading: Icon(icon),
      title: BoxText.caption(title),
      trailing: const Icon(Icons.navigate_next_outlined),
    );
  }
}