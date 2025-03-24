import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  bool build() {
    return true;
  }

  void changeTheme(value) {
    state = value;
  }
}
