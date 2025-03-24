import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/notifiers/navigation_notifier.dart';
import 'package:riverpod_demo/notifiers/theme_notifier.dart';

class NavigationPage extends ConsumerWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(navigationNotifierProvider);
    bool isLightMode = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        actions: [
          isLightMode
              ? IconButton(
                  onPressed: () {
                    ref.read(themeNotifierProvider.notifier).changeTheme(false);
                  },
                  icon: Icon(Icons.shield_moon))
              : IconButton(
                  onPressed: () {
                    ref.read(themeNotifierProvider.notifier).changeTheme(true);
                  },
                  icon: Icon(Icons.sunny))
        ],
      ),
      body: [
        Center(
            child: Text(
          'Call',
          style: TextTheme.of(context).headlineLarge,
        )),
        Center(
            child: Text(
          'Chat',
          style: TextTheme.of(context).headlineLarge,
        )),
        Center(
            child: Text(
          'Account',
          style: TextTheme.of(context).headlineLarge,
        )),
      ][index],
      bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) {
            ref
                .read(navigationNotifierProvider.notifier)
                .setSelectedIndex(value);
          },
          destinations: [
            NavigationDestination(
                selectedIcon: Icon(Icons.call),
                icon: Icon(Icons.call_outlined),
                label: 'Call'),
            NavigationDestination(
                selectedIcon: Icon(Icons.chat),
                icon: Icon(Icons.chat_outlined),
                label: 'Chat'),
            NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline),
                label: 'Account'),
          ]),
    );
  }
}
