import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/counter_provider.dart';
import 'package:riverpod_demo/services/user_service.dart';

final nameProvider = Provider<String>((ref) => 'David Warner');

final counterProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

final apiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider =
    FutureProvider((ref) => ref.read(apiProvider).getUser());
