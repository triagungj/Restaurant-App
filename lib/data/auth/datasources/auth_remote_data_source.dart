import 'package:dio/dio.dart';
import 'package:restaurant_app/core/constants/api_path.dart';
import 'package:restaurant_app/data/auth/models/models.dart';
import 'package:restaurant_app/data/default/models/models.dart';
import 'package:restaurant_app/domain/auth/entities/entities.dart';
import 'package:restaurant_app/domain/default/entities/entities.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> requestLogin(LoginBody body);
  Future<GeneralEntity> postRegister(RegisterBody body);
  Future<GeneralEntity> postForgotPassword(ForgotPasswordBody body);
  Future<GeneralEntity> postVerifyForgotPassword(VerifyForgotPasswordBody body);
  Future<GeneralEntity> postResetPassword(UpdatePasswordBody body);
  Future<GeneralEntity> postUpdatePassword(UpdatePasswordBody body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<LoginEntity> requestLogin(LoginBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.login,
        data: body.toJson(),
      );

      return LoginModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }

  @override
  Future<GeneralEntity> postRegister(RegisterBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.register,
        data: body.toJson(),
      );

      return GeneralModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }

  @override
  Future<GeneralEntity> postForgotPassword(ForgotPasswordBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.forgotPassword,
        data: body.toJson(),
      );

      return GeneralModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }

  @override
  Future<GeneralEntity> postVerifyForgotPassword(
      VerifyForgotPasswordBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.forgotPasswordVerify,
        data: body.toJson(),
      );

      return GeneralModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }

  @override
  Future<GeneralEntity> postResetPassword(UpdatePasswordBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.resetPassword,
        data: body.toJson(),
      );

      return GeneralModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }

  @override
  Future<GeneralEntity> postUpdatePassword(UpdatePasswordBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.updatePassword,
        data: body.toJson(),
      );

      return GeneralModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
}
