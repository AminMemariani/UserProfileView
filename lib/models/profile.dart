import 'dart:convert';

class Profile {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? totalPost;
  final String? totalFollowers;
  final String? totalFollowing;

  Profile({
    this.imageUrl,
    this.subtitle,
    this.title,
    this.totalFollowers,
    this.totalFollowing,
    this.totalPost,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'subtitle': subtitle,
      'totalPost': totalPost,
      'totalFollowers': totalFollowers,
      'totalFollowing': totalFollowing,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      totalPost: map['totalPost'] ?? '',
      totalFollowers: map['totalFollowers'] ?? '',
      totalFollowing: map['totalFollowing'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source));
}
