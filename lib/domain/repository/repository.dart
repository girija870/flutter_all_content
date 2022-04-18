import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flut_all_content/domain/model/model.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Response>> resetPassword(String email);
}
