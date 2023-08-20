import 'package:fb_clone/facebook_ui/widgets/avatar.dart';
import 'package:fb_clone/models/story.dart';
import 'package:flutter/material.dart';

final _stories = [
  Story(
    bg: 'assets/images/wallpapers/1.jpeg',
    avatar: 'assets/images/users/1.jpg',
    username: 'Raul Romero',
  ),
  Story(
    bg: 'assets/images/wallpapers/2.jpeg',
    avatar: 'assets/images/users/2.jpg',
    username: 'Gabriel',
  ),
  Story(
    bg: 'assets/images/wallpapers/3.jpeg',
    avatar: 'assets/images/users/3.jpg',
    username: 'Albert',
  ),
  Story(
    bg: 'assets/images/wallpapers/4.jpeg',
    avatar: 'assets/images/users/4.jpg',
    username: 'Rigobeto',
  ),
  Story(
    bg: 'assets/images/wallpapers/5.jpeg',
    avatar: 'assets/images/users/5.jpg',
    username: 'Gerardo',
  ),
  Story(
    bg: 'assets/images/wallpapers/6.jpeg',
    avatar: 'assets/images/users/6.jpg',
    username: 'Melissa',
  ),
];

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        itemBuilder: (_, i) => _StoryItem(v: _stories[i], isFirst: (i == 0)),
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({
    required this.v,
    required this.isFirst,
  });

  final Story v;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 90,
      margin: EdgeInsets.only(right: 15, left: isFirst ? 20 : 0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0,
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(v.bg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: AvatarWidget(
                    size: 40,
                    asset: v.avatar,
                    border: 3,
                  ),
                )
              ],
            ),
          ),
          Text(
            v.username,
            style: const TextStyle(fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
