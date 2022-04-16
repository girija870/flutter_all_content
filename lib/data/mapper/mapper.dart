import 'package:flut_all_content/app/extension.dart';
import 'package:flut_all_content/data/response/response.dart';
import 'package:flut_all_content/domain/model/model.dart';

const empty = "";
const zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id?.orEmpty() ?? empty,
        this?.name?.orEmpty() ?? empty,
        this?.noOfNotification?.orZero() ?? zero);
  }
}

extension ContactResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.email?.orEmpty() ?? empty,
        this?.phone?.orEmpty() ?? empty, this?.link?.orEmpty() ?? empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this!.customer.toDomain(), this!.contacts!.toDomain());
  }
}
