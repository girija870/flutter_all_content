import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flut_all_content/data/network/failure.dart';
import 'package:flut_all_content/domain/repository/repository.dart';
import 'package:flut_all_content/domain/usecase/base_usecase.dart';

class ForgotPasswordUseCase implements BaseUseCase<String ,Response> {

  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, Response>> execute(String input) async{
    return await _repository.resetPassword(input);
  }

}