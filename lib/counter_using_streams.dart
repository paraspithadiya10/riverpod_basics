import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers.dart';

class CounterUsingStreams extends ConsumerWidget {
  const CounterUsingStreams({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter using Streams'),
      ),
      body: streamData.when(
          data: ((data) => Center(
                child: Text(
                  data.toString(),
                  style: TextTheme.of(context).headlineLarge,
                ),
              )),
          error: ((e, stktrc) => Text(e.toString())),
          loading: () {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }),
    );
  }
}
