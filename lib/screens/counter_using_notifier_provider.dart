import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/notifiers/counter_notifier.dart';

class CounterUsingNotifierProvider extends ConsumerWidget {
  const CounterUsingNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counterNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$count',
              style: TextTheme.of(context).headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      ref.read(counterNotifierProvider.notifier).increment();
                    },
                    icon: Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      ref.read(counterNotifierProvider.notifier).decrement();
                      if (count <= 0) {
                        ref.invalidate(counterNotifierProvider);
                      }
                    },
                    icon: Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
