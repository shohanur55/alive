import '../entities/stream_entity.dart';

abstract class HomeRepository {
  Future<List<StreamEntity>> getStreams();

  Future<List<StreamEntity>> toggleFollow(String streamId);
}