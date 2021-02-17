import 'package:flutter/material.dart';
class IconButtonWidget extends StatelessWidget {
  final IconData iconName;
  final VoidCallback onPress;
  final Color iconColor;
  final Color iconBackgroundColor;
  const IconButtonWidget({
    Key key,
    this.iconName,
    this.onPress,
    this.iconColor,
    this.iconBackgroundColor
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(
          iconName,
          color: iconColor,
          size: 21,
        ),
      ),
    );
  }
}