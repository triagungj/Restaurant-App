import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_body.g.dart';

@JsonSerializable(createFactory: false)
class ForgotPasswordBody {
  const ForgotPasswordBody({
    required this.email,
  });
  final String email;

  Map<String, dynamic> toJson() => _$ForgotPasswordBodyToJson(this);
}
