import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'counter_notifier.g.dart';

@riverpod
class CounterNotifier extends _$CounterNotifier {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state = state + 5;
  }

  void decrement() {
    state = state - 5;
  }
}
