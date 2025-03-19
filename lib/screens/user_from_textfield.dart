import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/providers.dart';

class UserFromTextfield extends ConsumerWidget {
  const UserFromTextfield({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);
    //var user = ref.watch(userProvider.select((e) => e.name));
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              onChanged: (value) {
                ref.read(userProvider.notifier).updateName(value);
              },
              decoration: InputDecoration(
                  label: Text('Name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            TextField(
              onChanged: (value) {
                ref.read(userProvider.notifier).updateEmail(value);
              },
              decoration: InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Text('${user.name} \t${user.email}')
          ],
        ),
      ),
    );
  }
}
