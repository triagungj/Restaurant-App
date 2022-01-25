import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant_app/core/error/failures.dart';
import 'package:restaurant_app/data/auth/datasources/auth_local_data_source.dart';
import 'package:restaurant_app/data/auth/datasources/auth_remote_data_source.dart';
import 'package:restaurant_app/data/auth/models/models.dart';
import 'package:restaurant_app/domain/auth/entities/entities.dart';
import 'package:restaurant_app/domain/auth/repositories/auth_repository.dart';
import 'package:restaurant_app/domain/default/entities/entities.dart';

const errorMsg = 'Something went wrong';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  @override
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body) async {
    try {
      final remoteLogin = await remoteDataSource.requestLogin(body);
      await localDataSource.saveToken(remoteLogin.data.token);
      await localDataSource.isTeacher(true);
      return Right(remoteLogin);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    }
  }

  @override
  Future<Either<Failure, GeneralEntity>> postRegister(RegisterBody body) async {
    try {
      final remoteRegister = await remoteDataSource.postRegister(body);
      return Right(remoteRegister);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    }
  }

  @override
  Future<Either<Failure, GeneralEntity>> postForgotPassword(
      ForgotPasswordBody body) async {
    try {
      final remoteForgotPassword =
          await remoteDataSource.postForgotPassword(body);
      return Right(remoteForgotPassword);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    }
  }

  @override
  Future<Either<Failure, GeneralEntity>> postVerifyForgotPassword(
      VerifyForgotPasswordBody body) async {
    try {
      final remoteVerifyForgotPassword =
          await remoteDataSource.postVerifyForgotPassword(body);
      return Right(remoteVerifyForgotPassword);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    }
  }

  @override
  Future<Either<Failure, GeneralEntity>> postResetPassword(
      UpdatePasswordBody body) async {
    try {
      final remoteResetPassword =
          await remoteDataSource.postResetPassword(body);
      return Right(remoteResetPassword);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    }
  }

  @override
  Future<Either<Failure, GeneralEntity>> postUpdatePassword(
      UpdatePasswordBody body) async {
    try {
      final remoteUpdatePassword =
          await remoteDataSource.postUpdatePassword(body);
      return Right(remoteUpdatePassword);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    }
  }
}
