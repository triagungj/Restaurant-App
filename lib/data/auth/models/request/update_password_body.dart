import 'package:json_annotation/json_annotation.dart';

part 'update_password_body.g.dart';

@JsonSerializable(createFactory: false)
class UpdatePasswordBody {
  const UpdatePasswordBody({
    required this.password,
    required this.confirmPassword,
  });
  final String password;
  final String confirmPassword;

  Map<String, dynamic> toJson() => _$UpdatePasswordBodyToJson(this);
}
