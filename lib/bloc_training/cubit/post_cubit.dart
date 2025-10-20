import 'package:bloc/bloc.dart';

import '../model/post.dart';
import '../repo/remote_repo_api.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoading());

//get all posts
  Future<void> getPosts() async {
    try {
      final posts = await RemoteRepoApi().getPosts();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }

//get single post
  Future<void> getPost(int id) async {
    try {
      final post = await RemoteRepoApi().getPost(id);
      emit(PostLoaded(posts: [post]));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }

//create post
  Future<void> createPost(Post post) async {
    try {
      final createdPost = await RemoteRepoApi().createPost(post);
      emit(PostLoaded(posts: [createdPost]));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }

//update post
  Future<void> updatePost(Post post) async {
    try {
      final updatedPost = await RemoteRepoApi().updatePost(post);
      emit(PostLoaded(posts: [updatedPost]));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }
  // // In your PostCubit
  // Future<void> updatePost(Post post) async {
  //   try {
  //     emit(PostLoading());
  //     final updatedPost = await RemoteRepoApi().updatePost(post);
  //     // Update the post in your list or refetch all posts
  //     final currentState = state as PostLoaded;
  //     final updatedPosts = currentState.posts
  //         .map((p) => p.id == updatedPost.id ? updatedPost : p)
  //         .toList();
  //     emit(PostLoaded(posts: updatedPosts));
  //   } catch (e) {
  //     emit(PostError(message: e.toString()));
  //   }
  // }

//delete post
  Future<void> deletePost(int id) async {
    try {
      await RemoteRepoApi().deletePost(id);
      emit(PostDeleted(postId: id));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }
}
