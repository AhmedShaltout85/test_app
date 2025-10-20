import 'dart:developer';

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

  // Get a single post
  Future<Post> getPost(int id) async {
    final response = await dio.get('$baseUrl/posts/$id');
    if (response.statusCode == 200) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  // Create a new post
  Future<Post> createPost(Post post) async {
    final response = await dio.post(
      '$baseUrl/posts',
      data: post.toJson(),
    );
    if (response.statusCode == 201) {
      log(response.data.toString());

      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to create post');
    }
  }

  // Update an existing post
  Future<Post> updatePost(Post post) async {
    final response = await dio.put(
      '$baseUrl/posts/${post.id}',
      data: post.toJson(),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to update post');
    }
  }

  // Delete a post
  Future<void> deletePost(int id) async {
    final response = await dio.delete('$baseUrl/posts/$id');
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }

  //login post
  Future<Post> loginPost(Post post) async {
    final response = await dio.post(
      '$baseUrl/posts',
      data: post.toJson(),
    );
    if (response.statusCode == 201) {
      log(response.data.toString());
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to login post');
    }
  }

  //logout post
  Future<Post> logoutPost(Post post) async {
    final response = await dio.post(
      '$baseUrl/posts',
      data: post.toJson(),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to logout post');
    }
  }
}
