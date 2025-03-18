import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/player.dart';
import 'package:riverpod_demo/providers/providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider(Player('Dhoni', '7', 'Weeket-Keeper')));
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}
