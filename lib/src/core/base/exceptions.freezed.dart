// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomException {
  String get message => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? field,
            Object? originalError, StackTrace? stackTrace)
        parsing,
    required TResult Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)
        validation,
    required TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)
        illegalOperation,
    required TResult Function(String message, String? resource,
            String? identifier, StackTrace? stackTrace)
        notFound,
    required TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)
        unauthorized,
    required TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult? Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)?
        validation,
    TResult? Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult? Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult? Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult? Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult Function(String message, String field, Map<String, dynamic>? errors,
            StackTrace? stackTrace)?
        validation,
    TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParsingException value) parsing,
    required TResult Function(ValidationException value) validation,
    required TResult Function(IllegalOperationException value) illegalOperation,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParsingException value)? parsing,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(IllegalOperationException value)? illegalOperation,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParsingException value)? parsing,
    TResult Function(ValidationException value)? validation,
    TResult Function(IllegalOperationException value)? illegalOperation,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomExceptionCopyWith<CustomException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomExceptionCopyWith<$Res> {
  factory $CustomExceptionCopyWith(
          CustomException value, $Res Function(CustomException) then) =
      _$CustomExceptionCopyWithImpl<$Res, CustomException>;
  @useResult
  $Res call({String message, StackTrace? stackTrace});
}

/// @nodoc
class _$CustomExceptionCopyWithImpl<$Res, $Val extends CustomException>
    implements $CustomExceptionCopyWith<$Res> {
  _$CustomExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParsingExceptionImplCopyWith<$Res>
    implements $CustomExceptionCopyWith<$Res> {
  factory _$$ParsingExceptionImplCopyWith(_$ParsingExceptionImpl value,
          $Res Function(_$ParsingExceptionImpl) then) =
      __$$ParsingExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? field,
      Object? originalError,
      StackTrace? stackTrace});
}

/// @nodoc
class __$$ParsingExceptionImplCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$ParsingExceptionImpl>
    implements _$$ParsingExceptionImplCopyWith<$Res> {
  __$$ParsingExceptionImplCopyWithImpl(_$ParsingExceptionImpl _value,
      $Res Function(_$ParsingExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? field = freezed,
    Object? originalError = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ParsingExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      originalError:
          freezed == originalError ? _value.originalError : originalError,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ParsingExceptionImpl implements ParsingException {
  const _$ParsingExceptionImpl(
      {required this.message, this.field, this.originalError, this.stackTrace});

  @override
  final String message;
  @override
  final String? field;
  @override
  final Object? originalError;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'CustomException.parsing(message: $message, field: $field, originalError: $originalError, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParsingExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.field, field) || other.field == field) &&
            const DeepCollectionEquality()
                .equals(other.originalError, originalError) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, field,
      const DeepCollectionEquality().hash(originalError), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParsingExceptionImplCopyWith<_$ParsingExceptionImpl> get copyWith =>
      __$$ParsingExceptionImplCopyWithImpl<_$ParsingExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? field,
            Object? originalError, StackTrace? stackTrace)
        parsing,
    required TResult Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)
        validation,
    required TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)
        illegalOperation,
    required TResult Function(String message, String? resource,
            String? identifier, StackTrace? stackTrace)
        notFound,
    required TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)
        unauthorized,
    required TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)
        unknown,
  }) {
    return parsing(message, field, originalError, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult? Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)?
        validation,
    TResult? Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult? Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult? Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult? Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
  }) {
    return parsing?.call(message, field, originalError, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult Function(String message, String field, Map<String, dynamic>? errors,
            StackTrace? stackTrace)?
        validation,
    TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (parsing != null) {
      return parsing(message, field, originalError, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParsingException value) parsing,
    required TResult Function(ValidationException value) validation,
    required TResult Function(IllegalOperationException value) illegalOperation,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return parsing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParsingException value)? parsing,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(IllegalOperationException value)? illegalOperation,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return parsing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParsingException value)? parsing,
    TResult Function(ValidationException value)? validation,
    TResult Function(IllegalOperationException value)? illegalOperation,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (parsing != null) {
      return parsing(this);
    }
    return orElse();
  }
}

abstract class ParsingException implements CustomException {
  const factory ParsingException(
      {required final String message,
      final String? field,
      final Object? originalError,
      final StackTrace? stackTrace}) = _$ParsingExceptionImpl;

  @override
  String get message;
  String? get field;
  Object? get originalError;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$ParsingExceptionImplCopyWith<_$ParsingExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationExceptionImplCopyWith<$Res>
    implements $CustomExceptionCopyWith<$Res> {
  factory _$$ValidationExceptionImplCopyWith(_$ValidationExceptionImpl value,
          $Res Function(_$ValidationExceptionImpl) then) =
      __$$ValidationExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String field,
      Map<String, dynamic>? errors,
      StackTrace? stackTrace});
}

/// @nodoc
class __$$ValidationExceptionImplCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$ValidationExceptionImpl>
    implements _$$ValidationExceptionImplCopyWith<$Res> {
  __$$ValidationExceptionImplCopyWithImpl(_$ValidationExceptionImpl _value,
      $Res Function(_$ValidationExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? field = null,
    Object? errors = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ValidationExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ValidationExceptionImpl implements ValidationException {
  const _$ValidationExceptionImpl(
      {required this.message,
      required this.field,
      final Map<String, dynamic>? errors,
      this.stackTrace})
      : _errors = errors;

  @override
  final String message;
  @override
  final String field;
  final Map<String, dynamic>? _errors;
  @override
  Map<String, dynamic>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'CustomException.validation(message: $message, field: $field, errors: $errors, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.field, field) || other.field == field) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, field,
      const DeepCollectionEquality().hash(_errors), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationExceptionImplCopyWith<_$ValidationExceptionImpl> get copyWith =>
      __$$ValidationExceptionImplCopyWithImpl<_$ValidationExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? field,
            Object? originalError, StackTrace? stackTrace)
        parsing,
    required TResult Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)
        validation,
    required TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)
        illegalOperation,
    required TResult Function(String message, String? resource,
            String? identifier, StackTrace? stackTrace)
        notFound,
    required TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)
        unauthorized,
    required TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)
        unknown,
  }) {
    return validation(message, field, errors, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult? Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)?
        validation,
    TResult? Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult? Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult? Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult? Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
  }) {
    return validation?.call(message, field, errors, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult Function(String message, String field, Map<String, dynamic>? errors,
            StackTrace? stackTrace)?
        validation,
    TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, field, errors, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParsingException value) parsing,
    required TResult Function(ValidationException value) validation,
    required TResult Function(IllegalOperationException value) illegalOperation,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParsingException value)? parsing,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(IllegalOperationException value)? illegalOperation,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParsingException value)? parsing,
    TResult Function(ValidationException value)? validation,
    TResult Function(IllegalOperationException value)? illegalOperation,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationException implements CustomException {
  const factory ValidationException(
      {required final String message,
      required final String field,
      final Map<String, dynamic>? errors,
      final StackTrace? stackTrace}) = _$ValidationExceptionImpl;

  @override
  String get message;
  String get field;
  Map<String, dynamic>? get errors;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$ValidationExceptionImplCopyWith<_$ValidationExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IllegalOperationExceptionImplCopyWith<$Res>
    implements $CustomExceptionCopyWith<$Res> {
  factory _$$IllegalOperationExceptionImplCopyWith(
          _$IllegalOperationExceptionImpl value,
          $Res Function(_$IllegalOperationExceptionImpl) then) =
      __$$IllegalOperationExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? operation,
      String? reason,
      StackTrace? stackTrace});
}

/// @nodoc
class __$$IllegalOperationExceptionImplCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$IllegalOperationExceptionImpl>
    implements _$$IllegalOperationExceptionImplCopyWith<$Res> {
  __$$IllegalOperationExceptionImplCopyWithImpl(
      _$IllegalOperationExceptionImpl _value,
      $Res Function(_$IllegalOperationExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? operation = freezed,
    Object? reason = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$IllegalOperationExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      operation: freezed == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$IllegalOperationExceptionImpl implements IllegalOperationException {
  const _$IllegalOperationExceptionImpl(
      {required this.message, this.operation, this.reason, this.stackTrace});

  @override
  final String message;
  @override
  final String? operation;
  @override
  final String? reason;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'CustomException.illegalOperation(message: $message, operation: $operation, reason: $reason, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IllegalOperationExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, operation, reason, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IllegalOperationExceptionImplCopyWith<_$IllegalOperationExceptionImpl>
      get copyWith => __$$IllegalOperationExceptionImplCopyWithImpl<
          _$IllegalOperationExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? field,
            Object? originalError, StackTrace? stackTrace)
        parsing,
    required TResult Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)
        validation,
    required TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)
        illegalOperation,
    required TResult Function(String message, String? resource,
            String? identifier, StackTrace? stackTrace)
        notFound,
    required TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)
        unauthorized,
    required TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)
        unknown,
  }) {
    return illegalOperation(message, operation, reason, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult? Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)?
        validation,
    TResult? Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult? Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult? Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult? Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
  }) {
    return illegalOperation?.call(message, operation, reason, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult Function(String message, String field, Map<String, dynamic>? errors,
            StackTrace? stackTrace)?
        validation,
    TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (illegalOperation != null) {
      return illegalOperation(message, operation, reason, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParsingException value) parsing,
    required TResult Function(ValidationException value) validation,
    required TResult Function(IllegalOperationException value) illegalOperation,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return illegalOperation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParsingException value)? parsing,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(IllegalOperationException value)? illegalOperation,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return illegalOperation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParsingException value)? parsing,
    TResult Function(ValidationException value)? validation,
    TResult Function(IllegalOperationException value)? illegalOperation,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (illegalOperation != null) {
      return illegalOperation(this);
    }
    return orElse();
  }
}

abstract class IllegalOperationException implements CustomException {
  const factory IllegalOperationException(
      {required final String message,
      final String? operation,
      final String? reason,
      final StackTrace? stackTrace}) = _$IllegalOperationExceptionImpl;

  @override
  String get message;
  String? get operation;
  String? get reason;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$IllegalOperationExceptionImplCopyWith<_$IllegalOperationExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundExceptionImplCopyWith<$Res>
    implements $CustomExceptionCopyWith<$Res> {
  factory _$$NotFoundExceptionImplCopyWith(_$NotFoundExceptionImpl value,
          $Res Function(_$NotFoundExceptionImpl) then) =
      __$$NotFoundExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? resource,
      String? identifier,
      StackTrace? stackTrace});
}

/// @nodoc
class __$$NotFoundExceptionImplCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$NotFoundExceptionImpl>
    implements _$$NotFoundExceptionImplCopyWith<$Res> {
  __$$NotFoundExceptionImplCopyWithImpl(_$NotFoundExceptionImpl _value,
      $Res Function(_$NotFoundExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? resource = freezed,
    Object? identifier = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$NotFoundExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$NotFoundExceptionImpl implements NotFoundException {
  const _$NotFoundExceptionImpl(
      {required this.message, this.resource, this.identifier, this.stackTrace});

  @override
  final String message;
  @override
  final String? resource;
  @override
  final String? identifier;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'CustomException.notFound(message: $message, resource: $resource, identifier: $identifier, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.resource, resource) ||
                other.resource == resource) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, resource, identifier, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      __$$NotFoundExceptionImplCopyWithImpl<_$NotFoundExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? field,
            Object? originalError, StackTrace? stackTrace)
        parsing,
    required TResult Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)
        validation,
    required TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)
        illegalOperation,
    required TResult Function(String message, String? resource,
            String? identifier, StackTrace? stackTrace)
        notFound,
    required TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)
        unauthorized,
    required TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)
        unknown,
  }) {
    return notFound(message, resource, identifier, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult? Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)?
        validation,
    TResult? Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult? Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult? Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult? Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
  }) {
    return notFound?.call(message, resource, identifier, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult Function(String message, String field, Map<String, dynamic>? errors,
            StackTrace? stackTrace)?
        validation,
    TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message, resource, identifier, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParsingException value) parsing,
    required TResult Function(ValidationException value) validation,
    required TResult Function(IllegalOperationException value) illegalOperation,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParsingException value)? parsing,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(IllegalOperationException value)? illegalOperation,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParsingException value)? parsing,
    TResult Function(ValidationException value)? validation,
    TResult Function(IllegalOperationException value)? illegalOperation,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundException implements CustomException {
  const factory NotFoundException(
      {required final String message,
      final String? resource,
      final String? identifier,
      final StackTrace? stackTrace}) = _$NotFoundExceptionImpl;

  @override
  String get message;
  String? get resource;
  String? get identifier;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedExceptionImplCopyWith<$Res>
    implements $CustomExceptionCopyWith<$Res> {
  factory _$$UnauthorizedExceptionImplCopyWith(
          _$UnauthorizedExceptionImpl value,
          $Res Function(_$UnauthorizedExceptionImpl) then) =
      __$$UnauthorizedExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, String? requiredPermission, StackTrace? stackTrace});
}

/// @nodoc
class __$$UnauthorizedExceptionImplCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$UnauthorizedExceptionImpl>
    implements _$$UnauthorizedExceptionImplCopyWith<$Res> {
  __$$UnauthorizedExceptionImplCopyWithImpl(_$UnauthorizedExceptionImpl _value,
      $Res Function(_$UnauthorizedExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? requiredPermission = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$UnauthorizedExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      requiredPermission: freezed == requiredPermission
          ? _value.requiredPermission
          : requiredPermission // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$UnauthorizedExceptionImpl implements UnauthorizedException {
  const _$UnauthorizedExceptionImpl(
      {required this.message, this.requiredPermission, this.stackTrace});

  @override
  final String message;
  @override
  final String? requiredPermission;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'CustomException.unauthorized(message: $message, requiredPermission: $requiredPermission, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requiredPermission, requiredPermission) ||
                other.requiredPermission == requiredPermission) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, requiredPermission, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedExceptionImplCopyWith<_$UnauthorizedExceptionImpl>
      get copyWith => __$$UnauthorizedExceptionImplCopyWithImpl<
          _$UnauthorizedExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? field,
            Object? originalError, StackTrace? stackTrace)
        parsing,
    required TResult Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)
        validation,
    required TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)
        illegalOperation,
    required TResult Function(String message, String? resource,
            String? identifier, StackTrace? stackTrace)
        notFound,
    required TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)
        unauthorized,
    required TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)
        unknown,
  }) {
    return unauthorized(message, requiredPermission, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult? Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)?
        validation,
    TResult? Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult? Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult? Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult? Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
  }) {
    return unauthorized?.call(message, requiredPermission, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult Function(String message, String field, Map<String, dynamic>? errors,
            StackTrace? stackTrace)?
        validation,
    TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message, requiredPermission, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParsingException value) parsing,
    required TResult Function(ValidationException value) validation,
    required TResult Function(IllegalOperationException value) illegalOperation,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParsingException value)? parsing,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(IllegalOperationException value)? illegalOperation,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParsingException value)? parsing,
    TResult Function(ValidationException value)? validation,
    TResult Function(IllegalOperationException value)? illegalOperation,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedException implements CustomException {
  const factory UnauthorizedException(
      {required final String message,
      final String? requiredPermission,
      final StackTrace? stackTrace}) = _$UnauthorizedExceptionImpl;

  @override
  String get message;
  String? get requiredPermission;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$UnauthorizedExceptionImplCopyWith<_$UnauthorizedExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownExceptionImplCopyWith<$Res>
    implements $CustomExceptionCopyWith<$Res> {
  factory _$$UnknownExceptionImplCopyWith(_$UnknownExceptionImpl value,
          $Res Function(_$UnknownExceptionImpl) then) =
      __$$UnknownExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? originalError, StackTrace? stackTrace});
}

/// @nodoc
class __$$UnknownExceptionImplCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$UnknownExceptionImpl>
    implements _$$UnknownExceptionImplCopyWith<$Res> {
  __$$UnknownExceptionImplCopyWithImpl(_$UnknownExceptionImpl _value,
      $Res Function(_$UnknownExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? originalError = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$UnknownExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      originalError:
          freezed == originalError ? _value.originalError : originalError,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$UnknownExceptionImpl implements UnknownException {
  const _$UnknownExceptionImpl(
      {required this.message, this.originalError, this.stackTrace});

  @override
  final String message;
  @override
  final Object? originalError;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'CustomException.unknown(message: $message, originalError: $originalError, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other.originalError, originalError) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(originalError), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      __$$UnknownExceptionImplCopyWithImpl<_$UnknownExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? field,
            Object? originalError, StackTrace? stackTrace)
        parsing,
    required TResult Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)
        validation,
    required TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)
        illegalOperation,
    required TResult Function(String message, String? resource,
            String? identifier, StackTrace? stackTrace)
        notFound,
    required TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)
        unauthorized,
    required TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)
        unknown,
  }) {
    return unknown(message, originalError, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult? Function(String message, String field,
            Map<String, dynamic>? errors, StackTrace? stackTrace)?
        validation,
    TResult? Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult? Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult? Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult? Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
  }) {
    return unknown?.call(message, originalError, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? field, Object? originalError,
            StackTrace? stackTrace)?
        parsing,
    TResult Function(String message, String field, Map<String, dynamic>? errors,
            StackTrace? stackTrace)?
        validation,
    TResult Function(String message, String? operation, String? reason,
            StackTrace? stackTrace)?
        illegalOperation,
    TResult Function(String message, String? resource, String? identifier,
            StackTrace? stackTrace)?
        notFound,
    TResult Function(
            String message, String? requiredPermission, StackTrace? stackTrace)?
        unauthorized,
    TResult Function(
            String message, Object? originalError, StackTrace? stackTrace)?
        unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, originalError, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParsingException value) parsing,
    required TResult Function(ValidationException value) validation,
    required TResult Function(IllegalOperationException value) illegalOperation,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParsingException value)? parsing,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(IllegalOperationException value)? illegalOperation,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParsingException value)? parsing,
    TResult Function(ValidationException value)? validation,
    TResult Function(IllegalOperationException value)? illegalOperation,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownException implements CustomException {
  const factory UnknownException(
      {required final String message,
      final Object? originalError,
      final StackTrace? stackTrace}) = _$UnknownExceptionImpl;

  @override
  String get message;
  Object? get originalError;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
