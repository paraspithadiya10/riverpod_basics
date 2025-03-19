import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/name_provider.dart';

class NameFromGeneratedProvider extends ConsumerWidget {
  const NameFromGeneratedProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Center(
        child: Text(
          name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
