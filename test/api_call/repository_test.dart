import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:testing_future_example/api_call/repository.dart';
import 'package:testing_future_example/locator.dart';

import 'repository_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
late Repo repo;

  setUpAll(() {

    setup();
    repo = getIt<Repo>();

    
  },);
  group('fetchAlbum', () {

    test('http call successful', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async => http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

      expect(response.body, '{"userId": 1, "id": 2, "title": "mock"}' );

      final result = await repo.fetchAlbum(client);

      expect(result, isA<Album>());

      // expect(jsonDecode(), '{"userId": 1, "id": 2, "title": "mock"}');
      
    },);

    test('Throw Excetpion if http call fail ', () {
      final client = MockClient();

      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async => http.Response('Not found', 404));

      expect(repo.fetchAlbum(client), throwsException);
    },);
    
  },);
}