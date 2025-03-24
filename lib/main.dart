import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/providers.dart';
import 'package:riverpod_demo/screens/counter_using_notifier_provider.dart';
import 'package:riverpod_demo/screens/home_page.dart';
import 'package:riverpod_demo/screens/name_from_generated_provider.dart';
import 'package:riverpod_demo/screens/user_from_textfield.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: CounterUsingNotifierProvider(),
    );
  }
}
