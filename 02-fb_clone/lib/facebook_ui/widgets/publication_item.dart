import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone/facebook_ui/widgets/avatar.dart';
import 'package:fb_clone/models/publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;

class PublicationItemWidget extends StatelessWidget {
  final Publication publication;

  const PublicationItemWidget({Key? key, required this.publication})
      : super(key: key);

  String _getEmojiPath(Reaction reaction) => switch (reaction) {
        Reaction.like => 'assets/images/emojis/like.svg',
        Reaction.love => 'assets/images/emojis/heart.svg',
        Reaction.laughing => 'assets/images/emojis/laughing.svg',
        Reaction.sad => 'assets/images/emojis/sad.svg',
        Reaction.shocking => 'assets/images/emojis/shocked.svg',
        Reaction.angry => 'assets/images/emojis/angry.svg'
      };

  String formatCount(int v) =>
      (v <= 1000) ? '$v' : '${(v / 1000).toStringAsFixed(1)}k';

  @override
  Widget build(BuildContext context) {
    const pd = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

    const lstReactions = Reaction.values;

    return Container(
      // width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 4, color: Color(0xffe8e8e8))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: pd,
            child: Row(
              children: [
                AvatarWidget(size: 40, asset: publication.user.avatar),
                const SizedBox(width: 10),
                Text(publication.user.username),
                const Spacer(),
                Text(timeago.format(publication.createdAt))
              ],
            ),
          ),
          InteractiveViewer(
            maxScale: 10.0,
            minScale: 0.01,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: publication.imageUrl,
              ),
            ),
          ),
          Padding(
            padding: pd.copyWith(top: 15),
            child: Text(
              publication.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    lstReactions.length,
                    (i) {
                      final reaction = lstReactions[i];
                      final isActive =
                          reaction == publication.currentUserReaction;
                      return Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              _getEmojiPath(reaction),
                              height: 25,
                            ),
                            const SizedBox(height: 2),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: isActive
                                  ? Colors.redAccent
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                              '${formatCount(publication.commentsCount)} Comments'),
                          const SizedBox(width: 15),
                          Text('${formatCount(publication.sharesCount)} Shares')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
