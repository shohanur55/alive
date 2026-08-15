part of '../dependency_injection.dart';

@Riverpod(keepAlive: true)
AuthenticationRepository authenticationRepository(Ref ref) {
  return AuthenticationRepositoryImpl(
    remote: ref.read(restClientServiceProvider),
    local: ref.read(cacheServiceProvider),
    authRemoteDataSource: ref.read(authRemoteDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(
    remoteDataSource: ref.read(homeRemoteDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
RouterRepository routerRepository(Ref ref) {
  return RouterRepositoryImpl(cacheService: ref.read(cacheServiceProvider));
}

@Riverpod(keepAlive: true)
LocaleRepository localeRepository(Ref ref) {
  return LocaleRepositoryImpl(ref.read(cacheServiceProvider));
}
