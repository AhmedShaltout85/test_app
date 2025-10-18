
import 'package:dio/dio.dart';

import '../model/post.dart';

class RemoteRepoApi {
  // static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  final dio = Dio();
  Future<List<Post>> getPosts() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return Post.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load albums');
    }
  }
}

