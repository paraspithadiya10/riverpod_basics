import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'player_notifier.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  List<Map<String, dynamic>> allPlayers = [
    {"name": "dhoni", "country": "india"},
    {"name": "ravindra jadeja", "country": "india"},
    {"name": "rachin ravindra", "country": "new zeland"},
    {"name": "devon conway", "country": "new zeland"},
    {"name": "ab deviliars", "country": "south africa"},
    {"name": "david miller", "country": "south africa"},
    {"name": "kane williamson", "country": "new zeland"},
    {"name": "david warner", "country": "australia"},
    {"name": "ben stokes", "country": "england"},
    {"name": "jos butler", "country": "england"},
    {"name": "sam curren", "country": "england"},
    {"name": "travis head", "country": "australia"},
  ];

  @override
  List<Map<String, dynamic>> build() {
    return allPlayers;
  }

  void filterPlayer(String playerName) {
    List<Map<String, dynamic>> results = [];
    if (playerName.isEmpty) {
      results = allPlayers;
    } else {
      results = state
          .where((player) => player['name']
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    }
    state = results;
  }
}
