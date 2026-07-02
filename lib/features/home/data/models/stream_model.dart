import '../../domain/entities/stream_entity.dart';

class StreamModel {
  const StreamModel({
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

  StreamEntity toEntity() {
    return StreamEntity(
      id: id,
      name: name,
      viewers: viewers,
      imageUrl: imageUrl,
      flag: flag,
      isFollowing: isFollowing,
    );
  }

  StreamModel copyWith({bool? isFollowing}) {
    return StreamModel(
      id: id,
      name: name,
      viewers: viewers,
      imageUrl: imageUrl,
      flag: flag,
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }
}