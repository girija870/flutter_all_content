import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flut_all_content/data/data_source/remote_data_source.dart';
import 'package:flut_all_content/data/mapper/mapper.dart';
import 'package:flut_all_content/data/network/failure.dart';
import 'package:flut_all_content/data/network/network_info.dart';
import 'package:flut_all_content/data/request/request.dart';
import 'package:flut_all_content/domain/model/model.dart';
import 'package:flut_all_content/domain/repository/repository.dart';

import '../network/error_handler.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        //its safe to call api
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) // success
        {
          //return data success(200)
          //return right
          return Right(response.toDomain());
        } else {
          //return biz logic error
          //return left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      //return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.forgotPassword(email);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());

        } else {
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
