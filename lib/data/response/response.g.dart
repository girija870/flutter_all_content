// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['noOfNotification'] as int?,
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'noOfNotification': instance.noOfNotification,
    };

ContactsResponse _$ContactsResponseFromJson(Map<String, dynamic> json) =>
    ContactsResponse(
      json['phone'] as String?,
      json['link'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$ContactsResponseToJson(ContactsResponse instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'link': instance.link,
      'email': instance.email,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['customer'] == null
          ? null
          : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>),
      json['contacts'] == null
          ? null
          : ContactsResponse.fromJson(json['contacts'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      json['support'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'support': instance.support,
    };

ServicesDetailsResponse _$ServicesDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ServicesDetailsResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$ServicesDetailsResponseToJson(
        ServicesDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.serviceTitle,
      'image': instance.serviceImage,
    };

BannerDetailsResponse _$BannerDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    BannerDetailsResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$BannerDetailsResponseToJson(
        BannerDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.bannerTitle,
      'link': instance.bannerImageLink,
    };

StoresDetailsResponse _$StoresDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    StoresDetailsResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$StoresDetailsResponseToJson(
        StoresDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.storeTitle,
      'image': instance.storeImage,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['services'] as List<dynamic>?)
          ?.map((e) =>
              ServicesDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['banners'] as List<dynamic>?)
          ?.map(
              (e) => BannerDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stores'] as List<dynamic>?)
          ?.map(
              (e) => StoresDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'services': instance.servicesDetailsResponse,
      'banners': instance.bannerDetailsResponse,
      'stores': instance.storesDetailsResponse,
    };

HomeDetailsResponse _$HomeDetailsResponseFromJson(Map<String, dynamic> json) =>
    HomeDetailsResponse(
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeDetailsResponseToJson(
        HomeDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

StoreDetailsResponse _$StoreDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    StoreDetailsResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
      json['services'] as String?,
      json['details'] as String?,
      json['about'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$StoreDetailsResponseToJson(
        StoreDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'title': instance.storeTitle,
      'image': instance.storeImage,
      'services': instance.services,
      'details': instance.details,
      'about': instance.about,
    };
