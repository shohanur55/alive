import '../entities/stream_entity.dart';
import '../repositories/home_repository.dart';

class ToggleFollowStreamUseCase {
  ToggleFollowStreamUseCase(this._repository);

  final HomeRepository _repository;

  Future<List<StreamEntity>> call(String streamId) {
    return _repository.toggleFollow(streamId);
  }
}