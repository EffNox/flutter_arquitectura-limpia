import 'package:fb_clone/facebook_ui/widgets/avatar.dart';
import 'package:flutter/material.dart';

class WhatIsOnYourMind extends StatelessWidget {
  const WhatIsOnYourMind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          AvatarWidget(
            size: 50,
            asset: 'assets/images/users/1.jpg',
          ),
          SizedBox(width: 20),
          Flexible(
            child: Text(
              "What's on your mind, Lisa?",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textWidthBasis: TextWidthBasis.longestLine,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
