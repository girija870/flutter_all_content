import 'package:flut_all_content/data/network/error_handler.dart';

import '../response/response.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute in milliseconds

const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";
const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 1 minute in milliseconds

abstract class LocalDataSource {
  Future<HomeDetailsResponse> fetchHomeDetails();

  Future<void> saveHomeToCache(HomeDetailsResponse homeDetailsResponse);

  Future<SingleStoreDetailsResponse> fetchSingleStoreDetails();

  Future<void> saveStoreDetailsToCache(
      SingleStoreDetailsResponse singleStoreDetailsResponse);

  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImplementer implements LocalDataSource {
  //run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  Future<HomeDetailsResponse> fetchHomeDetails() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];

    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      //return the response from the cache
      return cachedItem.data;
    } else {
      //return error that cache is not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeDetailsResponse homeDetailsResponse) async {
    cacheMap[CACHE_HOME_KEY] = CachedItem(homeDetailsResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<SingleStoreDetailsResponse> fetchSingleStoreDetails() {
    CachedItem? cachedItem = cacheMap[CACHE_STORE_DETAILS_KEY];
    if (cachedItem != null &&
        cachedItem.isValid(CACHE_STORE_DETAILS_INTERVAL)) {
      //return the response from the cache
      return cachedItem.data;
    } else {
      //return error that cache is not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveStoreDetailsToCache(
      SingleStoreDetailsResponse singleStoreDetailsResponse) async {
    cacheMap[CACHE_STORE_DETAILS_KEY] = CachedItem(singleStoreDetailsResponse);
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTime) {
    //expiration time is 60 secs
    int currentTimeMillis = DateTime.now()
        .millisecondsSinceEpoch; //lets assume current time is 1:00:00
    bool isCacheValid = currentTimeMillis - expirationTime <
        cacheTime; //lets assume cache time was in 12:59:30
    //false is current time > 1:00:30
    // true if current time < 1:00:30
    return isCacheValid;
  }
}
