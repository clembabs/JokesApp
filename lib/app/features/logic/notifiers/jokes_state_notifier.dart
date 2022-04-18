import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/app/features/data/joke_model.dart';
import 'package:jokes_app/app/features/logic/repository/jokes_repository.dart';
import 'package:jokes_app/app/features/logic/state/jokes_state.dart';

class JokesNotifier extends StateNotifier<JokesState> {
  JokesNotifier({
    required IJokesRepository jokesRepository,
  })  : _jokesRepository = jokesRepository,
        super(const JokesState.initial());

  final IJokesRepository _jokesRepository;

  Future<void> getJoke() async {
    state = const JokesState.loading();

    try {
      final JokeModel joke = await _jokesRepository.getJoke();
      state = JokesState.data(joke: joke);
    } catch (_) {
      state = const JokesState.error('Error!');
    }
  }
}
