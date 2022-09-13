import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel{

    @JsonKey(name: 'name')
     String? name;

    @JsonKey(name: 'email')
    String? email;

    @JsonKey(name: 'access_token')
    String? access_token;

    LoginModel();

    factory LoginModel.fromJson(Map<String, dynamic> json) =>
        _$LoginModelFromJson(json);

    Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}