import 'package:dartz/dartz.dart';
import 'package:flut_all_content/data/network/failure.dart';
import 'package:flut_all_content/domain/model/model.dart';
import 'package:flut_all_content/domain/repository/repository.dart';
import 'package:flut_all_content/domain/usecase/base_usecase.dart';

class StoreDetailsUseCase implements BaseUseCase<void, SingleStoreDetail> {
  final Repository _repository;

  StoreDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, SingleStoreDetail>> execute(void input) async {
    return await _repository.fetchSingleStoreDetails();
  }
}
