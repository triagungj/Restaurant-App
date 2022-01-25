import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable(createFactory: false)
class RegisterBody {
  const RegisterBody({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.password,
    required this.confirmPassword,
  });

  final String name;
  final String phoneNumber;
  final String email;
  final String username;
  final String password;
  final String confirmPassword;

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);
}
