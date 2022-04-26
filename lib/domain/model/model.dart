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

class HomeStore {
  int id;
  String title;
  String image;

  HomeStore(this.id, this.title, this.image);
}

class HomeBannerAd {
  int id;
  String title;
  String link;

  HomeBannerAd(this.id, this.title, this.link);
}

class HomeServices {
  int id;
  String title;
  String image;

  HomeServices(this.id, this.title, this.image);
}

class HomeData {
  List<HomeServices>? services;
  List<HomeBannerAd>? bannerAd;
  List<HomeStore>? store;

  HomeData(this.services, this.bannerAd, this.store);
}

class HomeObject {
  HomeData data;

  HomeObject(this.data);
}
