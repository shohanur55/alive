part of '../dependency_injection.dart';

@Riverpod(keepAlive: true)
CacheService cacheService(Ref ref) {
  return SharedPreferencesService(
    ref.read(sharedPreferencesProvider).requireValue,
  );
}

@riverpod
RestClient restClientService(Ref ref) {
  return RestClient(ref.read(dioProvider));
}

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return FirebaseAuthRemoteDataSource();
}

@Riverpod(keepAlive: true)
HomeRemoteDataSource homeRemoteDataSource(Ref ref) {
  return FakeHomeRemoteDataSource();
}
