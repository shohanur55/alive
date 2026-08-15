import '../../core/base/result.dart';
import '../entities/stream_entity.dart';
import '../repositories/home_repository.dart';

final class GetStreamsUseCase {
  GetStreamsUseCase(this.repository);

  final HomeRepository repository;

  Future<Result<List<StreamEntity>, String>> call() async {
    final result = await repository.getStreams();
    return switch (result) {
      Success(:final data) => Success(data: data),
      Error(:final error) => Error(error.message),
      _ => const Error('Failed to load streams'),
    };
  }
}

final class ToggleFollowStreamUseCase {
  ToggleFollowStreamUseCase(this.repository);

  final HomeRepository repository;

  Future<Result<List<StreamEntity>, String>> call(String streamId) async {
    final result = await repository.toggleFollow(streamId);
    return switch (result) {
      Success(:final data) => Success(data: data),
      Error(:final error) => Error(error.message),
      _ => const Error('Failed to toggle follow status'),
    };
  }
}
