import 'package:faker/faker.dart';
import 'package:fb_clone/facebook_ui/widgets/circle_button.dart';
import 'package:fb_clone/facebook_ui/widgets/publication_item.dart';
import 'package:fb_clone/facebook_ui/widgets/quick_actions.dart';
import 'package:fb_clone/facebook_ui/widgets/stories.dart';
import 'package:fb_clone/facebook_ui/widgets/what_is_on_your_mind.dart';
import 'package:fb_clone/icons/fb_clone_icons.dart';
import 'package:fb_clone/models/publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacebookPage extends StatelessWidget {
  const FacebookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lstPublications = <Publication>[];

    final fk = Faker();
    const lstReactions = Reaction.values;

    for (var i = 0; i < 50; i++) {
      final rnd = fk.randomGenerator;

      final reactionIdx = rnd.integer(lstReactions.length - 1);

      final publication = Publication(
        user: User(username: fk.person.name(), avatar: fk.image.image()),
        title: fk.lorem.sentence(),
        createdAt: fk.date.dateTime(),
        imageUrl: fk.image.image(),
        commentsCount: rnd.integer(50000),
        sharesCount: rnd.integer(50000),
        currentUserReaction: lstReactions[reactionIdx],
      );

      lstPublications.add(publication);
    }

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Facebook'),
        leadingWidth: 150,
        leading: SvgPicture.asset(
          'assets/images/logos/facebook.svg',
          colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          semanticsLabel: 'Facebook Logo',
        ),
        actions: const [
          CircleButtonWidget(
            color: Colors.grey,
            icon: FbClone.search,
          ),
          SizedBox(width: 12),
          CircleButtonWidget(
            color: Colors.redAccent,
            icon: FbClone.campana,
          ),
          SizedBox(width: 12),
          CircleButtonWidget(
            color: Colors.blueAccent,
            icon: FbClone.people,
            showBadge: true,
          ),
          SizedBox(width: 12),
          CircleButtonWidget(
            color: Colors.blue,
            icon: FbClone.mss,
          ),
        ],
      ),
      body: ListView(
        // padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 15),
          const WhatIsOnYourMind(),
          const SizedBox(height: 15),
          const QuickActionsWidget(),
          const SizedBox(height: 15),
          const StoriesWidget(),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lstReactions.length,
            itemBuilder: (_, i) =>
                PublicationItemWidget(publication: lstPublications[i]),
          ),
        ],
      ),
    );
  }
}
