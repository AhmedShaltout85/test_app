import 'package:dio/dio.dart';

import '../model/post.dart';

class RemoteRepoApi {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  // Singleton
  RemoteRepoApi._();
  static final RemoteRepoApi _remoteRepoApi = RemoteRepoApi._();
  var dio = Dio();
  factory RemoteRepoApi() {
    return _remoteRepoApi..dio = Dio();
  }
  // Get all posts
  Future<List<Post>> getPosts() async {
    final response = await dio.get('$baseUrl/posts');
    if (response.statusCode == 200) {
      return Post.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
