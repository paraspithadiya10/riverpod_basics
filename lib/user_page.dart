import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: userData.when(
          data: (data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.network('${data[index].avatar}'),
                      ),
                      title: Text(
                          '${data[index].firstName} ${data[index].lastName}'),
                      subtitle: Text('${data[index].email}'),
                    ),
                  );
                });
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: (() {
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
