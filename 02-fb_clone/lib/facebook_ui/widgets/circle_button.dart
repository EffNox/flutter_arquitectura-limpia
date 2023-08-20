import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool showBadge;
  const CircleButtonWidget(
      {Key? key,
      required this.color,
      required this.icon,
      this.showBadge = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white),
          ),
          if (showBadge)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            )
        ],
      ),
    );
  }
}
