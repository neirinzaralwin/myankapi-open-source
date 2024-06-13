import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'login_req_model.g.dart';

LoginReqModel loginReqModelFromJson(String str) =>
    LoginReqModel.fromJson(json.decode(str));

String loginReqModelToJson(LoginReqModel data) => json.encode(data.toJson());

@JsonSerializable()
class LoginReqModel {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  LoginReqModel({
    this.email,
    this.password,
  });

  factory LoginReqModel.fromJson(Map<String, dynamic> json) =>
      _$LoginReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqModelToJson(this);
}
