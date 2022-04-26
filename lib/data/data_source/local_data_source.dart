import 'package:flut_all_content/data/network/error_handler.dart';

import '../response/response.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minnute in milliseconds

abstract class LocalDataSource {
  Future<HomeDetailsResponse> fetchHomeDetails();

  Future<void> saveHomeToCache(HomeDetailsResponse homeDetailsResponse);

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
