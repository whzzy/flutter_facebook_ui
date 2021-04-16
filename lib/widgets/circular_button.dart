import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({
    Key key,
    @required this.onpressed,
    @required this.icon,
  }) : super(key: key);

  final Function onpressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(
          icon,
          color: Colors.black,
          size: 30.0,
        ),
      ),
    );
  }
}
