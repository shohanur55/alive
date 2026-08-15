class StreamEntity {
  const StreamEntity({
    required this.id,
    required this.name,
    required this.viewers,
    required this.imageUrl,
    required this.flag,
    required this.isFollowing,
  });

  final String id;
  final String name;
  final String viewers;
  final String imageUrl;
  final String flag;
  final bool isFollowing;

  StreamEntity copyWith({
    String? id,
    String? name,
    String? viewers,
    String? imageUrl,
    String? flag,
    bool? isFollowing,
  }) {
    return StreamEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      viewers: viewers ?? this.viewers,
      imageUrl: imageUrl ?? this.imageUrl,
      flag: flag ?? this.flag,
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }
}
