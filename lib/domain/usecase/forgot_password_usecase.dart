import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flut_all_content/data/network/failure.dart';
import 'package:flut_all_content/domain/model/model.dart';
import 'package:flut_all_content/domain/repository/repository.dart';
import 'package:flut_all_content/domain/usecase/base_usecase.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, ForgotPassword> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgotPassword>> execute(input) async {
    return await _repository.forgotPassword(input);
  }
}
