import 'package:flut_all_content/album_provider.dart';
import 'package:flut_all_content/model/album.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

//Generate  a MockClient using the mockito package.
//Create a new instances of this class in each test
@GenerateMocks([http.Client])
main() {
  group('fetchAlbum', () {
    test('returns an album is the http call complete successfully', () async {
      final client = MockClient();
      //Use mockito to return a successful response when it calls the
      //provided http client
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(client), isA<Album>);
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      //use mockito to return an unsuccessful response when it calls the
      //provided http.Client
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(fetchAlbum(client), throwsException);
    });
  });
}
