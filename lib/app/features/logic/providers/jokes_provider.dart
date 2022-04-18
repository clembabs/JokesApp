//* Logic / StateNotifier
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/app/features/logic/notifiers/jokes_state_notifier.dart';
import 'package:jokes_app/app/features/logic/repository/jokes_repository.dart';
import 'package:jokes_app/app/features/logic/state/jokes_state.dart';

final StateNotifierProvider<JokesNotifier, JokesState> jokesNotifierProvider =
    StateNotifierProvider<JokesNotifier, JokesState>(
  (ref) => JokesNotifier(
    jokesRepository: ref.watch(_jokesRepositoryProvider),
  ),
);

//* Repository
final Provider<IJokesRepository> _jokesRepositoryProvider =
    Provider<IJokesRepository>(
  (ref) => JokesRepository(),
);
