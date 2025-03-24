import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/player.dart';
import 'package:riverpod_demo/model/user.dart';
import 'package:riverpod_demo/notifiers/counter_state_notifier.dart';
import 'package:riverpod_demo/notifiers/user_notifier.dart';
import 'package:riverpod_demo/services/user_service.dart';

final nameProvider = Provider.family<String, Player>((ref, player) {
  return 'Name: ${player.name},  jearsyNo: ${player.jersyNo},  Role: ${player.role}';
});

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

final themeProvider = StateProvider<bool>((ref) => true);

final userProvider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier(User(name: "dummy name", email: "dummy email")));
