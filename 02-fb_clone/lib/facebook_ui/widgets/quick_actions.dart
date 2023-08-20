import 'package:fb_clone/facebook_ui/widgets/circle_button.dart';
import 'package:fb_clone/icons/fb_clone_icons.dart';
import 'package:flutter/material.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            _QuickButton(
              icon: FbClone.images,
              color: Color(0xffa7cca0),
              text: 'Gallery',
            ),
            SizedBox(width: 15),
            _QuickButton(
              icon: FbClone.people,
              color: Color(0xff76aeed),
              text: 'Tag Friends',
            ),
            SizedBox(width: 15),
            _QuickButton(
              icon: FbClone.videocamera,
              color: Color(0xfff49e81),
              text: 'Live',
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _QuickButton(
      {required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        color: color.withOpacity(.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleButtonWidget(
            color: color,
            icon: icon,
          ),
          const SizedBox(width: 15),
          Text(text,
              style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}



/* 
  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuickButton(
              icon: FbClone.images,
              color: Color(0xffa7cca0),
              text: 'Gallery',
            ),
            QuickButton(
              icon: FbClone.people,
              color: Color(0xff76aeed),
              text: 'Tag Friends',
            ),
            QuickButton(
              icon: FbClone.videocamera,
              color: Color(0xfff49e81),
              text: 'Live',
            ),
            QuickButton(
              icon: FbClone.videocamera,
              color: Color(0xfff49e81),
              text: 'Live',
            ),
            QuickButton(
              icon: FbClone.videocamera,
              color: Color(0xfff49e81),
              text: 'Live',
            ),
          ],
        ),
      )
 */


/* 
  const Wrap(
      children: [
        QuickButton(
          icon: FbClone.images,
          color: Color(0xffa7cca0),
          text: 'Gallery',
        ),
        QuickButton(
          icon: FbClone.people,
          color: Color(0xff76aeed),
          text: 'Tag Friends',
        ),
        QuickButton(
          icon: FbClone.videocamera,
          color: Color(0xfff49e81),
          text: 'Live',
        ),
        QuickButton(
          icon: FbClone.videocamera,
          color: Color(0xfff49e81),
          text: 'Live',
        ),
        QuickButton(
          icon: FbClone.videocamera,
          color: Color(0xfff49e81),
          text: 'Live',
        ),
      ],
    )
 */
