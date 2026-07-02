import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/home_remote_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/get_streams.dart';
import '../../domain/usecases/toggle_follow_stream.dart';

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return FakeHomeRemoteDataSource();
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final remoteDataSource = ref.watch(homeRemoteDataSourceProvider);
  return HomeRepositoryImpl(remoteDataSource);
});

final getStreamsUseCaseProvider = Provider<GetStreamsUseCase>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetStreamsUseCase(repository);
});

final toggleFollowStreamUseCaseProvider =
    Provider<ToggleFollowStreamUseCase>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return ToggleFollowStreamUseCase(repository);
});