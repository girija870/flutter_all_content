import 'package:dartz/dartz.dart';
import 'package:flut_all_content/data/network/failure.dart';
import 'package:flut_all_content/domain/repository/repository.dart';
import 'package:flut_all_content/domain/usecase/base_usecase.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgotPassword(input);
  }
}
