import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flut_all_content/data/data_source/remote_data_source.dart';
import 'package:flut_all_content/data/mapper/mapper.dart';
import 'package:flut_all_content/data/network/failure.dart';
import 'package:flut_all_content/data/network/network_info.dart';

import '../../domain/model/model.dart';
import '../../domain/repository/repository.dart';
import '../data_source/local_data_source.dart';
import '../network/error_handler.dart';
import '../request/request.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

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
          //return data success(200)
          //return right
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

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          //return biz logic error
          //return left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        //return Dio and other customization error
        //return left
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeObject>> fetchHomeDetails() async {
    try {
      //get from cache
      final response = await _localDataSource.fetchHomeDetails();
      return Right(response.toDomain());
    } catch (cacheError) {
      //we have cache error so we should call api
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSource.fetchHomeDetails();
          if (response.status == ApiInternalStatus.SUCCESS) {
            //right-> success
            //save response to local data source
            _localDataSource.saveHomeToCache(response);
            return Right(response.toDomain());
          } else {
            //return biz logic error
            //return left
            return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DEFAULT));
          }
        } catch (error) {
          //return Dio and other customization error
          //return left
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        //return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, SingleStoreDetail>> fetchSingleStoreDetails() async {
    try {
      //get data from cache
      final response = await _localDataSource.fetchSingleStoreDetails();
      log("fromCache");
      return Right(response.toDomain());
    } catch (cacheError) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSource.fetchSingleStoreDetails();
          if (response.status == ApiInternalStatus.SUCCESS) {
            //right-> success

            //save data to local data store
            _localDataSource.saveStoreDetailsToCache(response);
            return Right(response.toDomain());
          } else {
            //return biz logic error
            //return left
            return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DEFAULT));
          }
        } catch (error) {
          //return Dio and other customization error
          //return left
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        //return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
}
