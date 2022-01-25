import 'package:dartz/dartz.dart';
import 'package:restaurant_app/core/error/failures.dart';
import 'package:restaurant_app/data/auth/models/models.dart';
import 'package:restaurant_app/domain/auth/entities/entities.dart';
import 'package:restaurant_app/domain/default/entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body);
  Future<Either<Failure, GeneralEntity>> postRegister(RegisterBody body);
  Future<Either<Failure, GeneralEntity>> postForgotPassword(
      ForgotPasswordBody body);
  Future<Either<Failure, GeneralEntity>> postVerifyForgotPassword(
      VerifyForgotPasswordBody body);
  Future<Either<Failure, GeneralEntity>> postResetPassword(
      UpdatePasswordBody body);
  Future<Either<Failure, GeneralEntity>> postUpdatePassword(
      UpdatePasswordBody body);
}
