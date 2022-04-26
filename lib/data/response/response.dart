import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "noOfNotification")
  int? noOfNotification;

  CustomerResponse(this.id, this.name, this.noOfNotification);

  //from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "email")
  String? email;

  ContactsResponse(this.phone, this.link, this.email);

  //from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);

//from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  @JsonKey(name: "support")
  String? support;

  ForgotPasswordResponse(this.support);

//from json
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}

@JsonSerializable()
class ServicesDetailsResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? serviceTitle;

  @JsonKey(name: "image")
  String? serviceImage;

  ServicesDetailsResponse(this.id, this.serviceTitle, this.serviceImage);

//from json
  factory ServicesDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesDetailsResponseFromJson(json);

//toJson
  Map<String, dynamic> toJson() => _$ServicesDetailsResponseToJson(this);
}

@JsonSerializable()
class BannerDetailsResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? bannerTitle;

  @JsonKey(name: "link")
  String? bannerImageLink;

  BannerDetailsResponse(this.id, this.bannerTitle, this.bannerImageLink);

//from json
  factory BannerDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerDetailsResponseFromJson(json);

//toJson
  Map<String, dynamic> toJson() => _$BannerDetailsResponseToJson(this);
}

@JsonSerializable()
class StoresDetailsResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? storeTitle;

  @JsonKey(name: "image")
  String? storeImage;

  StoresDetailsResponse(this.id, this.storeTitle, this.storeImage);

//from json
  factory StoresDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresDetailsResponseFromJson(json);

//toJson
  Map<String, dynamic> toJson() => _$StoresDetailsResponseToJson(this);
}

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: "services")
  List<ServicesDetailsResponse>? servicesDetailsResponse;

  @JsonKey(name: "banners")
  List<BannerDetailsResponse>? bannerDetailsResponse;

  @JsonKey(name: "stores")
  List<StoresDetailsResponse>? storesDetailsResponse;

  HomeDataResponse(this.servicesDetailsResponse, this.bannerDetailsResponse,
      this.storesDetailsResponse);

//form json
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

//toJson
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class HomeDetailsResponse extends BaseResponse {
  @JsonKey(name: "data")
  HomeDataResponse? data;

  HomeDetailsResponse(this.data);

//from json
  factory HomeDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDetailsResponseFromJson(json);

//toJson
  Map<String, dynamic> toJson() => _$HomeDetailsResponseToJson(this);
}

@JsonSerializable()
class StoreDetailsResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? storeTitle;

  @JsonKey(name: "image")
  String? storeImage;

  @JsonKey(name: "services")
  String? services;

  @JsonKey(name: "details")
  String? details;

  @JsonKey(name: "about")
  String? about;

  StoreDetailsResponse(this.id, this.storeTitle, this.storeImage, this.services,
      this.details, this.about);

  //fromJson
  factory StoreDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresDetailsResponseFromJson(json);

//toJson
  Map<String, dynamic> toJson() => _$StoresDetailsResponseToJson(this);
}
