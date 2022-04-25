import 'package:flut_all_content/app/extension.dart';
import 'package:flut_all_content/data/response/response.dart';
import 'package:flut_all_content/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id?.orEmpty() ?? EMPTY,
        this?.name?.orEmpty() ?? EMPTY,
        this?.noOfNotification?.orZero() ?? ZERO);
  }
}

extension ContactResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.email?.orEmpty() ?? EMPTY,
        this?.phone?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this!.customer.toDomain(), this!.contacts!.toDomain());
  }
}

extension ForgotPasswordMapper on ForgotPasswordResponse {
  String toDomain() {
    return support?.orEmpty() ?? EMPTY;
  }
}

extension ServicesResponseMapper on ServicesDetailsResponse {
  HomeServices toDomain() {
    return HomeServices(id?.orEmpty() ?? EMPTY,
        serviceTitle?.orEmpty() ?? EMPTY, serviceImage?.orEmpty() ?? EMPTY);
  }
}

extension BannerResponseMapper on BannerDetailsResponse {
  HomeBannerAd toDomain() {
    return HomeBannerAd(id?.orEmpty() ?? EMPTY, bannerTitle?.orEmpty() ?? EMPTY,
        bannerImageLink?.orEmpty() ?? EMPTY);
  }
}

extension StoreResponseMapper on StoresDetailsResponse {
  HomeStore toDomain() {
    return HomeStore(id?.orEmpty() ?? EMPTY, storeTitle?.orEmpty() ?? EMPTY,
        storeImage?.orEmpty() ?? EMPTY);
  }
}

extension HomeDetailsResponseMapper on HomeDetailsResponse {
  HomeObject toDomain() {
    List<HomeServices> _homeServices = servicesDetailsResponse.map((service) =>
        service.toDomain()) ?? Iterable.empty()
    ).cast<HomeServices>().toList();
    List<HomeServices> mappedServices =

    return HomeObject(
    );
  }
}
