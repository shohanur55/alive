import '../entities/stream_entity.dart';
import '../repositories/home_repository.dart';

class GetStreamsUseCase {
  GetStreamsUseCase(this._repository);

  final HomeRepository _repository;

  Future<List<StreamEntity>> call() {
    return _repository.getStreams();
  }
}