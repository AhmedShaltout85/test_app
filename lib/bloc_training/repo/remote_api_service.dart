import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_app/bloc_training/repo/remote_repo.dart';

import '../../constant/constant.dart';
import '../model/post.dart';

class RemoteApiService extends RemoteRepo {
  // static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  // Singleton
  RemoteApiService._();
  static final RemoteApiService _remoteRepoApi = RemoteApiService._();
  var dio = Dio();
  factory RemoteApiService() {
    return _remoteRepoApi
      ..dio = Dio(
        BaseOptions(
          baseUrl: Constant.baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': '*',
          },
        ),
      );
  }
  // Get all posts
  @override
  Future<List<Post>> getPosts() async {
    final response = await dio.get('${Constant.baseUrl}/posts');
    if (response.statusCode == 200) {
      return Post.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load albums');
    }
  }

  // Get a single post
  @override
  Future<Post> getPost(int id) async {
    final response = await dio.get('${Constant.baseUrl}/posts/$id');
    if (response.statusCode == 200) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  // Create a new post
  @override
  Future<Post> createPost(Post post) async {
    final response = await dio.post(
      '${Constant.baseUrl}/posts',
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
  @override
  Future<Post> updatePost(Post post) async {
    final response = await dio.put(
      '${Constant.baseUrl}/posts/${post.id}',
      data: post.toJson(),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to update post');
    }
  }

  // Delete a post
  @override
  Future<void> deletePost(int id) async {
    final response = await dio.delete('${Constant.baseUrl}/posts/$id');
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }

  //login post
  @override
  Future<Post> loginPost(Post post) async {
    final response = await dio.post(
      '${Constant.baseUrl}/posts',
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
  @override
  Future<Post> logoutPost(Post post) async {
    final response = await dio.post(
      '${Constant.baseUrl}/posts',
      data: post.toJson(),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to logout post');
    }
  }
}
