class Publication {
  final User user;
  final String title;
  final DateTime createdAt;
  final String imageUrl;
  final int commentsCount;
  final int sharesCount;
  final Reaction currentUserReaction;

  Publication({
    required this.user,
    required this.title,
    required this.createdAt,
    required this.imageUrl,
    required this.commentsCount,
    required this.sharesCount,
    required this.currentUserReaction,
  });
}

class User {
  final String username;
  final String avatar;

  User({required this.username, required this.avatar});
}

enum Reaction { like, love, laughing, sad, shocking, angry }
