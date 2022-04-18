import 'package:dio/dio.dart';
import 'package:jokes_app/app/features/data/joke_model.dart';

abstract class IJokesRepository {
  Future<JokeModel> getJoke();
}

class JokesRepository implements IJokesRepository {
  final Dio _dioClient = Dio();
  final String url = 'https://v2.jokeapi.dev/joke/Any?type=twopart';

  @override
  Future<JokeModel> getJoke() async {
    try {
      final result = await _dioClient.get(url);
      if (result.statusCode == 200) {
        return JokeModel.fromJson(result.data);
      } else {
        throw Exception();
      }
    } catch (_) {
      throw Exception();
    }
  }
}
