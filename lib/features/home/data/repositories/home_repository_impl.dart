import '../../domain/entities/stream_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasource/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<List<StreamEntity>> getStreams() async {
    final streams = await _remoteDataSource.fetchStreams();
    return streams.map((stream) => stream.toEntity()).toList(growable: false);
  }

  @override
  Future<List<StreamEntity>> toggleFollow(String streamId) async {
    final streams = await _remoteDataSource.toggleFollow(streamId);
    return streams.map((stream) => stream.toEntity()).toList(growable: false);
  }
}