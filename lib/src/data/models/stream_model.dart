import '../../domain/entities/stream_entity.dart';

class StreamModel extends StreamEntity {
  const StreamModel({
    required super.id,
    required super.name,
    required super.viewers,
    required super.imageUrl,
    required super.flag,
    required super.isFollowing,
  });

  factory StreamModel.fromEntity(StreamEntity entity) {
    return StreamModel(
      id: entity.id,
      name: entity.name,
      viewers: entity.viewers,
      imageUrl: entity.imageUrl,
      flag: entity.flag,
      isFollowing: entity.isFollowing,
    );
  }

  factory StreamModel.fromJson(Map<String, dynamic> json) {
    return StreamModel(
      id: json['id'] as String,
      name: json['name'] as String,
      viewers: json['viewers'] as String,
      imageUrl: json['imageUrl'] as String,
      flag: json['flag'] as String,
      isFollowing: json['isFollowing'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'viewers': viewers,
      'imageUrl': imageUrl,
      'flag': flag,
      'isFollowing': isFollowing,
    };
  }
}
