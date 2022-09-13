// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel()
    ..name = json['name'] as String?
    ..email = json['email'] as String?
    ..access_token = json['access_token'] as String?;
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'access_token': instance.access_token,
    };
