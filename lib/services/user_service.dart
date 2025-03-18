import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_demo/model/user_model.dart';

class ApiService {
  String url = 'https://reqres.in/api/users?page=1';

  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
