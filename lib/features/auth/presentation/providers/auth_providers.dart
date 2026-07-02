import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasource/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in_with_google.dart';
import '../../domain/usecases/sign_out.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return FirebaseAuthRemoteDataSource();
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
}

@riverpod
SignInWithGoogleUseCase signInWithGoogleUseCase(SignInWithGoogleUseCaseRef ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInWithGoogleUseCase(repository);
}

@riverpod
SignOutUseCase signOutUseCase(SignOutUseCaseRef ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUseCase(repository);
}

@riverpod
Stream<UserEntity?> authStateChanges(AuthStateChangesRef ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.authStateChanges;
}
