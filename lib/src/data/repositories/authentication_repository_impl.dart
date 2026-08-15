import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../models/login_model.dart';
import '../services/cache/cache_service.dart';
import '../services/network/auth_remote_datasource.dart';
import '../services/network/rest_client.dart';

final class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.remote,
    required this.local,
    required this.authRemoteDataSource,
  });

  final RestClient remote;
  final CacheService local;
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<SignUpResponseEntity> register(SignUpRequestEntity data) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<LoginResponseEntity, Failure>> login(
    LoginRequestEntity data,
  ) async {
    return asyncGuard(() async {
      final model = LoginRequestModel.fromEntity(data);
      final response = await remote.login(model.toMap());

      if (data.shouldRemeber ?? false) await _saveSession();

      return LoginResponseModel.fromJson(response.data);
    });
  }

  @override
  Future<Result<UserEntity?, Failure>> signInWithGoogle() async {
    return asyncGuard(() async {
      final userModel = await authRemoteDataSource.signInWithGoogle();
      if (userModel != null) {
        await _saveSession();
      }
      return userModel;
    });
  }

  @override
  Future<Result<void, Failure>> signOutUser() async {
    return asyncGuard(() async {
      await authRemoteDataSource.signOut();
      await logout();
    });
  }

  @override
  UserEntity? getCurrentUser() {
    return authRemoteDataSource.currentUser;
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return authRemoteDataSource.authStateChanges;
  }

  Future<void> _saveSession() async {
    await local.save(CacheKey.isLoggedIn, true);
  }

  @override
  Future<bool> rememberMe({bool? rememberMe}) async {
    try {
      if (rememberMe == null) {
        return local.get<bool>(CacheKey.rememberMe) ?? false;
      }
      await local.save(CacheKey.rememberMe, rememberMe);
      return rememberMe;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> forgotPassword(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<String> resetPassword(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<String> verifyOTP(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<String> resendOTP(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await local.remove([CacheKey.isLoggedIn, CacheKey.rememberMe]);
  }
}
