import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class MockDioClient extends Mock implements Dio {}

void mockClient(MockDioClient client) {
  final dio = Dio();
  client.options = dio.options;
  when(client.get(
    "https://dog.ceo/api/breed/hound/images/random",
  )).thenAnswer((_) async => Response(
      data: 'images.dog.ceo/breeds/hound-afghan/n02088094_1459.jpg',
      statusCode: 200,
      requestOptions: RequestOptions()));
}
