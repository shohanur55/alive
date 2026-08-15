import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/stream_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../services/network/home_remote_datasource.dart';

final class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({required this.remoteDataSource});

  final HomeRemoteDataSource remoteDataSource;

  @override
  Future<Result<List<StreamEntity>, Failure>> getStreams() async {
    return asyncGuard(() async {
      final models = await remoteDataSource.fetchStreams();
      return models.map((m) => m as StreamEntity).toList();
    });
  }

  @override
  Future<Result<List<StreamEntity>, Failure>> toggleFollow(
    String streamId,
  ) async {
    return asyncGuard(() async {
      final models = await remoteDataSource.toggleFollow(streamId);
      return models.map((m) => m as StreamEntity).toList();
    });
  }
}
