import 'package:flut_all_content/data/network/error_handler.dart';

class Failure {
  int code; //200 / 400
  String message;

  Failure(this.code, this.message); // success / failure

}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}
