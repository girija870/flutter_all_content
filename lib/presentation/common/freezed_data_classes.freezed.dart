// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginObjectTearOff {
  const _$LoginObjectTearOff();

  _LoginObject call(String userName, String password) {
    return _LoginObject(
      userName,
      password,
    );
  }
}

/// @nodoc
const $LoginObject = _$LoginObjectTearOff();

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res>;
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  final LoginObject _value;
  // ignore: unused_field
  final $Res Function(LoginObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$LoginObjectCopyWith(
          _LoginObject value, $Res Function(_LoginObject) then) =
      __$LoginObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userName, String password});
}

/// @nodoc
class __$LoginObjectCopyWithImpl<$Res> extends _$LoginObjectCopyWithImpl<$Res>
    implements _$LoginObjectCopyWith<$Res> {
  __$LoginObjectCopyWithImpl(
      _LoginObject _value, $Res Function(_LoginObject) _then)
      : super(_value, (v) => _then(v as _LoginObject));

  @override
  _LoginObject get _value => super._value as _LoginObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_LoginObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      __$LoginObjectCopyWithImpl<_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(String userName, String password) = _$_LoginObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RegisterViewObjectTearOff {
  const _$RegisterViewObjectTearOff();

  _RegisterViewObject call(
      String userName,
      String countryMobileCode,
      String email,
      String password,
      String mobileNumber,
      String profilePicture) {
    return _RegisterViewObject(
      userName,
      countryMobileCode,
      email,
      password,
      mobileNumber,
      profilePicture,
    );
  }
}

/// @nodoc
const $RegisterViewObject = _$RegisterViewObjectTearOff();

/// @nodoc
mixin _$RegisterViewObject {
  String get userName => throw _privateConstructorUsedError;
  String get countryMobileCode => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterViewObjectCopyWith<RegisterViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterViewObjectCopyWith<$Res> {
  factory $RegisterViewObjectCopyWith(
          RegisterViewObject value, $Res Function(RegisterViewObject) then) =
      _$RegisterViewObjectCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String countryMobileCode,
      String email,
      String password,
      String mobileNumber,
      String profilePicture});
}

/// @nodoc
class _$RegisterViewObjectCopyWithImpl<$Res>
    implements $RegisterViewObjectCopyWith<$Res> {
  _$RegisterViewObjectCopyWithImpl(this._value, this._then);

  final RegisterViewObject _value;
  // ignore: unused_field
  final $Res Function(RegisterViewObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? countryMobileCode = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? mobileNumber = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      countryMobileCode: countryMobileCode == freezed
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RegisterViewObjectCopyWith<$Res>
    implements $RegisterViewObjectCopyWith<$Res> {
  factory _$RegisterViewObjectCopyWith(
          _RegisterViewObject value, $Res Function(_RegisterViewObject) then) =
      __$RegisterViewObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String countryMobileCode,
      String email,
      String password,
      String mobileNumber,
      String profilePicture});
}

/// @nodoc
class __$RegisterViewObjectCopyWithImpl<$Res>
    extends _$RegisterViewObjectCopyWithImpl<$Res>
    implements _$RegisterViewObjectCopyWith<$Res> {
  __$RegisterViewObjectCopyWithImpl(
      _RegisterViewObject _value, $Res Function(_RegisterViewObject) _then)
      : super(_value, (v) => _then(v as _RegisterViewObject));

  @override
  _RegisterViewObject get _value => super._value as _RegisterViewObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? countryMobileCode = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? mobileNumber = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_RegisterViewObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      countryMobileCode == freezed
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterViewObject implements _RegisterViewObject {
  _$_RegisterViewObject(this.userName, this.countryMobileCode, this.email,
      this.password, this.mobileNumber, this.profilePicture);

  @override
  final String userName;
  @override
  final String countryMobileCode;
  @override
  final String email;
  @override
  final String password;
  @override
  final String mobileNumber;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'RegisterViewObject(userName: $userName, countryMobileCode: $countryMobileCode, email: $email, password: $password, mobileNumber: $mobileNumber, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterViewObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.countryMobileCode, countryMobileCode) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.mobileNumber, mobileNumber) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(countryMobileCode),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(mobileNumber),
      const DeepCollectionEquality().hash(profilePicture));

  @JsonKey(ignore: true)
  @override
  _$RegisterViewObjectCopyWith<_RegisterViewObject> get copyWith =>
      __$RegisterViewObjectCopyWithImpl<_RegisterViewObject>(this, _$identity);
}

abstract class _RegisterViewObject implements RegisterViewObject {
  factory _RegisterViewObject(
      String userName,
      String countryMobileCode,
      String email,
      String password,
      String mobileNumber,
      String profilePicture) = _$_RegisterViewObject;

  @override
  String get userName;
  @override
  String get countryMobileCode;
  @override
  String get email;
  @override
  String get password;
  @override
  String get mobileNumber;
  @override
  String get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$RegisterViewObjectCopyWith<_RegisterViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}
