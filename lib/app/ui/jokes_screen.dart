import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/app/features/logic/providers/jokes_provider.dart';
import 'package:jokes_app/app/features/logic/state/jokes_state.dart';
import 'package:jokes_app/app/ui/widgets/joke_card.dart';
import 'package:jokes_app/app/utils/app_version.dart';
import 'package:jokes_app/app/utils/translations.dart';

const contentSpacing = SizedBox(height: 50);

class JokesScreen extends StatelessWidget {
  ///JokesPage constructor
  const JokesScreen({Key? key}) : super(key: key);

  ///JokesPage [routeName]
  static const routeName = 'JokesPage';

  ///Router for JokesPage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const JokesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(kAppTitle), elevation: 0),
      body: Center(
        child: Column(
          children: const [
            Spacer(),
            JokeConsumer(),
            contentSpacing,
            _GetJokeButton(),
            contentSpacing,
            Spacer(),
            AppVersion(),
            contentSpacing,
          ],
        ),
      ),
    );
  }
}

class JokeConsumer extends ConsumerWidget {
  const JokeConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jokesNotifierProvider);

    return state.when(
      initial: () => const _Message(kTellJokeMessage),
      data: (joke) => JokeCard(joke: joke),
      loading: () => const CircularProgressIndicator(),
      error: (e) => const _Message('Error'),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        message,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _GetJokeButton extends ConsumerWidget {
  const _GetJokeButton();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jokesNotifierProvider);

    return CupertinoButton.filled(
      child: const Text(kGiveMeAJoke),
      onPressed: !state.isLoading
          ? () {
              ref.read(jokesNotifierProvider.notifier).getJoke();
            }
          : null,
    );
  }
}
