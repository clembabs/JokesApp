import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/app/core/providers/package_info_provider.dart';

class AppVersion extends ConsumerWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return ref.watch(packageInfoProvider).when(
          data: (info) => Text('v${info.version}', style: textTheme.caption),
          loading: () => const CircularProgressIndicator(),
          error: (error, _) => Text(error.toString()),
        );
  }
}
