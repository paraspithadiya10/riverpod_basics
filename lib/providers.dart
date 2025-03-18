import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/counter_provider.dart';

final nameProvider = Provider<String>((ref) => 'David Warner');

final counterProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());
