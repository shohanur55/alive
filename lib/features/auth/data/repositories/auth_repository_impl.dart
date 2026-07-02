import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Stream<UserEntity?> get authStateChanges {
    return _remoteDataSource.authStateChanges;
  }

  @override
  UserEntity? get currentUser {
    return _remoteDataSource.currentUser;
  }

  @override
  Future<UserEntity?> signInWithGoogle() async {
    return _remoteDataSource.signInWithGoogle();
  }

  @override
  Future<void> signOut() {
    return _remoteDataSource.signOut();
  }
}
