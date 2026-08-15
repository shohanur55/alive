import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../entities/stream_entity.dart';

abstract base class HomeRepository extends Repository {
  Future<Result<List<StreamEntity>, Failure>> getStreams();

  Future<Result<List<StreamEntity>, Failure>> toggleFollow(String streamId);
}
