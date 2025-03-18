import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/counter_provider.dart';
import 'package:riverpod_demo/services/user_service.dart';

final nameProvider = Provider<String>((ref) => 'David Warner');

final counterProvider =
    StateNotifierProvider.autoDispose<CounterDemo, int>((ref) {
  //ref.keepAlive();

  final link = ref.keepAlive();
  final timer = Timer(Duration(seconds: 10), () => link.close());
  ref.onDispose(() => timer.cancel());

  return CounterDemo();
});

final apiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider =
    FutureProvider((ref) => ref.read(apiProvider).getUser());

final streamProvider = StreamProvider(((ref) {
  return Stream.periodic(Duration(seconds: 1), ((count) => count));
}));
