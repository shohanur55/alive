# Clean Architecture — Agent Guidelines

This project uses a strict **Clean Architecture** pattern with **Flutter + Riverpod + GoRouter + Dio + Retrofit**.

---

## 🏛️ Project Layer Structure

```
lib/src/
├── core/           ← Shared infrastructure (DI, base classes, utilities, localization)
├── domain/         ← Business logic (Entities, Use Cases, Repository Interfaces)
├── data/           ← Data sources (Models, Repository Implementations, Services)
└── presentation/   ← UI (Pages, Widgets, Riverpod Providers, Router, Theme)
```

### Dependency Rule (STRICTLY ENFORCED)
- `Presentation` depends on `Domain` only
- `Data` depends on `Domain` only
- `Domain` depends on NOTHING (pure Dart)
- `Core` is shared across all layers

---

## 📁 Key File Locations

### Core Layer
| Purpose | File |
|---|---|
| Base Repository (asyncGuard) | `lib/src/core/base/repository.dart` |
| Result type (Success/Error) | `lib/src/core/base/result.dart` |
| Failure types | `lib/src/core/base/failure.dart` |
| All DI providers (entry) | `lib/src/core/di/dependency_injection.dart` |
| External providers (Dio, SharedPrefs) | `lib/src/core/di/parts/externals.dart` |
| Service providers | `lib/src/core/di/parts/services.dart` |
| Repository providers | `lib/src/core/di/parts/repository.dart` |
| UseCase providers | `lib/src/core/di/parts/use_cases.dart` |

### Domain Layer
| Purpose | File |
|---|---|
| Login entities | `lib/src/domain/entities/login_entity.dart` |
| SignUp entities | `lib/src/domain/entities/sign_up_entity.dart` |
| Auth repository interface | `lib/src/domain/repositories/authentication_repository.dart` |
| Auth use cases | `lib/src/domain/use_cases/authentication_use_case.dart` |
| Router use cases | `lib/src/domain/use_cases/router_use_case.dart` |

### Data Layer
| Purpose | File |
|---|---|
| API endpoints | `lib/src/data/services/network/endpoints.dart` |
| Retrofit REST client | `lib/src/data/services/network/rest_client.dart` |
| Token interceptor | `lib/src/data/services/network/interceptor/token_manager.dart` |
| Cache service | `lib/src/data/services/cache/shared_preference_service.dart` |
| Auth repository impl | `lib/src/data/repositories/authentication_repository_impl.dart` |
| Login model | `lib/src/data/models/login_model.dart` |

### Presentation Layer
| Purpose | File |
|---|---|
| App router | `lib/src/presentation/core/router/router.dart` |
| All route names | `lib/src/presentation/core/router/routes.dart` |
| Theme entry point | `lib/src/presentation/core/theme/theme.dart` |
| Color tokens (primitive) | `lib/src/presentation/core/theme/src/theme_extensions/src/colors/primitive.dart` |
| Light & Dark color sets | `lib/src/presentation/core/theme/src/theme_extensions/src/colors/color_extension.dart` |
| Font sizes | `lib/src/presentation/core/theme/src/theme_extensions/src/text_style.dart` |
| Spacing/Padding/Radius | `lib/src/presentation/core/theme/src/theme_extensions/src/dimensions.dart` |
| Typography widgets | `lib/src/presentation/core/widgets/text/typography.dart` |
| App startup provider | `lib/src/presentation/core/application_state/startup_provider/app_startup_provider.dart` |
| Router state (redirect logic) | `lib/src/presentation/core/router/router_state/router_state_provider.dart` |

---

## 🖥️ Screen List & Routes

| Screen | Route | File |
|---|---|---|
| Splash | `/splash` | `features/splash/view/splash_page.dart` |
| Onboarding | `/onboarding` | `features/onboarding/view/onboarding_page.dart` |
| Login | `/login` | `features/authentication/login/view/login_page.dart` |
| Registration | `/login/registration` | `features/authentication/registration/view/registration_page.dart` |
| Reset Password | `/login/reset-password` | `features/authentication/forgot_password/view/reset_password_page.dart` |
| Email Verification | `/login/email-verification` | `features/authentication/forgot_password/view/email_verification_page.dart` |
| Create New Password | `/login/create-new-password` | `features/authentication/forgot_password/view/create_new_password_page.dart` |
| Reset Success | `/login/reset-password-success` | `features/authentication/forgot_password/view/reset_password_success_page.dart` |
| Home | `/home` | `features/home/view/home_page.dart` |
| Profile | `/profile` | `features/profile/view/profile_page.dart` |

---

## 📐 Feature Folder Structure (Pattern)

Every feature follows this structure:
```
features/{feature_name}/
├── view/
│   └── {feature}_page.dart      ← UI (ConsumerStatefulWidget)
├── riverpod/
│   └── {feature}_provider.dart  ← State management
└── widgets/                     ← Page-specific sub-widgets
```

---

## ⚡ Code Patterns to Follow

### 1. Adding a New API Endpoint (step by step)
1. Add URL to `endpoints.dart`
2. Add method to `RestClient` with `@GET/@POST/@PUT/@DELETE` annotation
3. Create Entity in `domain/entities/`
4. Add method to Repository interface in `domain/repositories/`
5. Create UseCase in `domain/use_cases/`
6. Create Model in `data/models/` (extends Entity, adds JSON parsing)
7. Implement method in `data/repositories/` impl using `asyncGuard()`
8. Register UseCase in `di/parts/use_cases.dart`
9. Create Riverpod provider in `features/{feature}/riverpod/`
10. Use provider in the page with `ref.watch()` / `ref.listenManual()`

### 2. Repository Implementation Pattern
```dart
// ALWAYS use asyncGuard — never write try-catch manually
return asyncGuard(() async {
  final model = RequestModel.fromEntity(data);
  final response = await remote.apiMethod(model.toJson());
  return ResponseModel.fromJson(response.data);
});
```

### 3. UseCase Pattern
```dart
final class SomeUseCase {
  SomeUseCase(this.repository);
  final SomeRepository repository;

  Future<Result<ResponseEntity, String>> call(RequestEntity request) async {
    final result = await repository.method(request);
    return switch (result) {
      Success(:final data) => Success(data: data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}
```

### 4. Riverpod Provider Pattern
```dart
@riverpod
class SomeFeature extends _$SomeFeature {
  @override
  AsyncValue build() => const AsyncValue.data(null);

  void doSomething() async {
    if (state.isLoading) return;
    state = const AsyncValue.loading();
    final result = await ref.read(someUseCaseProvider).call(request);
    state = switch (result) {
      Success(:final data) => AsyncValue.data(data),
      Error(:final error) => AsyncValue.error(error, StackTrace.current),
      _ => AsyncValue.error('Something went wrong', StackTrace.current),
    };
  }
}
```

### 5. Page State Listening Pattern
```dart
@override
void initState() {
  super.initState();
  ref.listenManual(someProvider, (previous, next) {
    switch (next) {
      case AsyncData(:final value) when value != null:
        context.pushReplacementNamed(Routes.nextRoute);
      case AsyncError(:final error):
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
      default:
    }
  });
}
```

---

## 🎨 Theme Usage in Widgets

```dart
// Colors
context.color.primary
context.color.scaffoldBackground
context.color.text.primary
context.color.error

// Typography widgets (USE THESE instead of raw Text())
HeadingLargeText('Title')
HeadingSmallText('Subtitle')
BodyMediumText('Normal text')
BodyMediumText.secondary('Secondary text')

// Spacing/Padding
context.spacing.s16
context.padding.p16
context.radius.r6
```

---

## 🔑 Key Rules — NEVER Violate These

1. **NO API calls in UI (Page files)** — always go through UseCase → Repository
2. **NO try-catch in Repository** — use `asyncGuard()` from base class
3. **NO Dio/SharedPreferences imports in Domain layer** — Domain must stay pure Dart
4. **NO Repository Implementation used in Presentation** — always use Interface
5. **Use `ref.listenManual()` in `initState()`** for navigation side-effects
6. **One UseCase = One responsibility**
7. **Run `dart run build_runner build`** after adding any generated annotation

---

## 📦 Key Dependencies

| Package | Purpose |
|---|---|
| `flutter_riverpod` + `riverpod_annotation` | State management |
| `go_router` | Navigation |
| `dio` + `retrofit` | HTTP/API |
| `shared_preferences` | Local storage |
| `freezed` | Immutable classes (Result, Failure) |
| `dart_mappable` | JSON serialization for Models |
| `flutter_localizations` + `intl` | Multi-language |
| `gap` | Easy spacing |

---

## 🌐 Localization

String keys are in `lib/src/core/localization/intl_en.arb`.
Access in widgets: `context.locale.login`, `context.locale.home`, etc.
