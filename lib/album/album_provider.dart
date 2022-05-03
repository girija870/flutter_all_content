import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/album.dart';



Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    //if the server did return a 200 OK response ,
    //then parse the json
    return Album.fromJson(jsonDecode(response.body));
  } else {
    //if the server did not return a 200 ok response
    //then throw exception
    throw Exception('Failed to load album');
  }
}
