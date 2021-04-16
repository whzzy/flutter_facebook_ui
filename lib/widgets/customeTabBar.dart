import 'package:basic_flutter/config/palette.dart';
import 'package:flutter/material.dart';

class CustomeTabBar extends StatelessWidget {
  const CustomeTabBar({
    Key key,
    @required this.icons,
    @required this.onTap,
    @required this.selectedIndex,
  }) : super(key: key);
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
          border:
              Border(top: BorderSide(color: Palette.facebookBlue, width: 3))),
      tabs: icons
          .map(
            (e) => Tab(
              icon: Icon(
                e,
                color: Palette.facebookBlue,
              ),
            ),
          )
          .toList(),
      onTap: onTap,
    );
  }
}
