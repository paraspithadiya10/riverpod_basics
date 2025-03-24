import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/notifiers/player_notifier.dart';

class Players extends ConsumerWidget {
  const Players({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var players = ref.watch(playerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text('Search Players')),
              onChanged: (value) {
                ref.read(playerNotifierProvider.notifier).filterPlayer(value);
              },
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(players[index]['name']),
                        subtitle: Text(players[index]['country']),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
