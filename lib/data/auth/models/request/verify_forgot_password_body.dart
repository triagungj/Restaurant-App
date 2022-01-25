import 'package:json_annotation/json_annotation.dart';

part 'verify_forgot_password_body.g.dart';

@JsonSerializable(createFactory: false)
class VerifyForgotPasswordBody {
  const VerifyForgotPasswordBody({
    required this.email,
    required this.resetToken,
  });

  final String email;
  final String resetToken;

  Map<String, dynamic> toJson() => _$VerifyForgotPasswordBodyToJson(this);
}
