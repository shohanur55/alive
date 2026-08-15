part of '../dependency_injection.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
SignInWithGoogleUseCase signInWithGoogleUseCase(Ref ref) {
  return SignInWithGoogleUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
SignOutGoogleUseCase signOutGoogleUseCase(Ref ref) {
  return SignOutGoogleUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
GetCurrentUserUseCase getCurrentUserUseCase(Ref ref) {
  return GetCurrentUserUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
GetAuthStateChangesUseCase getAuthStateChangesUseCase(Ref ref) {
  return GetAuthStateChangesUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  return LogoutUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
GetStreamsUseCase getStreamsUseCase(Ref ref) {
  return GetStreamsUseCase(ref.read(homeRepositoryProvider));
}

@riverpod
ToggleFollowStreamUseCase toggleFollowStreamUseCase(Ref ref) {
  return ToggleFollowStreamUseCase(ref.read(homeRepositoryProvider));
}

@riverpod
GetCurrentLocaleUseCase getCurrentLocaleUseCase(Ref ref) {
  return GetCurrentLocaleUseCase(ref.read(localeRepositoryProvider));
}

@riverpod
SetCurrentLocaleUseCase setCurrentLocaleUseCase(Ref ref) {
  return SetCurrentLocaleUseCase(ref.read(localeRepositoryProvider));
}

@riverpod
ResetRepositoryUseCase resetRepositoryUseCase(Ref ref) {
  return const ResetRepositoryUseCase();
}

@riverpod
GetOnboardingStatusUseCase getOnboardingStatusUseCase(Ref ref) {
  return GetOnboardingStatusUseCase(ref.read(routerRepositoryProvider));
}

@riverpod
GetUserLoginStatusUseCase getUserLoginStatusUseCase(Ref ref) {
  return GetUserLoginStatusUseCase(ref.read(routerRepositoryProvider));
}

@riverpod
MarkOnboardingCompletedUseCase markOnboardingCompletedUseCase(Ref ref) {
  return MarkOnboardingCompletedUseCase(ref.read(routerRepositoryProvider));
}
