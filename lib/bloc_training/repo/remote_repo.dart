import '../model/post.dart';

abstract class RemoteRepo {
  // Define methods to interact with the remote API
  //get all posts
  Future<List<Post>> getPosts();
  //create post
  Future<Post> createPost(Post post);
  //get single post by id
  Future<Post> getPost(int id);
  //update post
  Future<Post> updatePost(Post post);
  //delete post
  Future<void> deletePost(int id);
  //login
  Future<Post> loginPost(Post post);
  //logout
  Future<Post> logoutPost(Post post);

}