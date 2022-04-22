import 'package:dartz/dartz.dart';
import 'package:flut_all_content/data/network/failure.dart';
import 'package:flut_all_content/data/request/request.dart';
import 'package:flut_all_content/domain/model/model.dart';
import 'package:flut_all_content/domain/repository/repository.dart';
import 'package:flut_all_content/domain/usecase/base_usecase.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return _repository.register(RegisterRequest(
        input.userName,
        input.countryMobileCode,
        input.email,
        input.password,
        input.mobileNumber,
        input.profilePicture));
  }
}

class RegisterUseCaseInput {
  String userName;
  String countryMobileCode;
  String email;
  String password;
  String mobileNumber;
  String profilePicture;

  RegisterUseCaseInput(this.userName, this.countryMobileCode, this.email,
      this.password, this.mobileNumber, this.profilePicture);
}
