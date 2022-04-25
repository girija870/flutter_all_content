class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String email;
  String phone;
  String link;

  Contacts(this.email, this.phone, this.link);
}

class Authentication {
  Customer customer;
  Contacts contacts;

  Authentication(this.customer, this.contacts);
}

class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}

class HomeObject {
  List<HomeServices>? services;
  List<HomeBannerAd>? bannerAd;
  List<HomeStore>? store;

  HomeObject(this.services, this.bannerAd, this.store);
}

class HomeStore {
  String id;
  String title;
  String image;

  HomeStore(this.id, this.title, this.image);
}

class HomeBannerAd {
  String id;
  String title;
  String link;

  HomeBannerAd(this.id, this.title, this.link);
}

class HomeServices {
  String id;
  String title;
  String image;

  HomeServices(this.id, this.title, this.image);
}
