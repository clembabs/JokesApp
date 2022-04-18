import 'package:flutter/material.dart';
import 'package:jokes_app/app/features/data/joke_model.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    Key? key,
    required this.joke,
  }) : super(key: key);

  final JokeModel joke;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                joke.setup ?? '',
                style: theme.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                joke.delivery ?? '',
                style: theme.textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Icon(
                joke.safe ? Icons.check : Icons.remove,
                color: joke.safe ? Colors.green : Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
