import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }
}
