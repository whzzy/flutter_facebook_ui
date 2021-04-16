import 'package:basic_flutter/config/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar(
      {Key key,
      @required this.imageUrl,
      this.isActive = false,
      this.hasBorder = false})
      : super(key: key);

 final  bool hasBorder;
 final  String imageUrl;
 final  bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(99),
              border: hasBorder
                  ? Border.all(width: 1.2, color: Palette.facebookBlue)
                  : null),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.online,
                      border: Border.all(width: 2.0, color: Colors.white)),
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
