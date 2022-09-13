import 'package:flutter_base/models/login_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
    @JsonKey(name: 'data')
    LoginModel? data;

    LoginResponse();

    factory LoginResponse.fromJson(Map<String, dynamic> json) =>
        _$LoginResponseFromJson(json);

    Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}