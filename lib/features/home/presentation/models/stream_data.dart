class StreamData {
  const StreamData({
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

  StreamData copyWith({bool? isFollowing}) {
    return StreamData(
      id: id,
      name: name,
      viewers: viewers,
      imageUrl: imageUrl,
      flag: flag,
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }
}