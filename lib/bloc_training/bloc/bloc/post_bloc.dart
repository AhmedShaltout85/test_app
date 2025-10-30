

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/post.dart';
import '../../repo/remote_api_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final RemoteApiService remoteApiService = RemoteApiService();

  PostBloc() : super(PostInitialState()) {
    on<PostLoadEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final posts = await remoteApiService.getPosts();
        emit(PostLoadSuccessState(posts: posts));
      } catch (e) {
        emit(PostErrorState(message: 'Failed to load posts: ${e.toString()}'));
      }
    });

    on<PostCreateEvent>((event, emit) async {
      final currentState = state;
      if (currentState is! PostLoadSuccessState) return;

      emit(PostLoadingState());
      try {
        final newPost = await remoteApiService.createPost(event.post);
        final updatedPosts = List<Post>.from(currentState.posts)..add(newPost);
        emit(PostCreateSuccessState(posts: updatedPosts));
      } catch (e) {
        emit(PostErrorState(message: 'Failed to create post: ${e.toString()}'));
        emit(currentState); // Revert to previous state
      }
    });

    on<PostUpdateEvent>((event, emit) async {
      final currentState = state;
      if (currentState is! PostLoadSuccessState) return;

      emit(PostLoadingState());
      try {
        final updatedPost = await remoteApiService.updatePost(event.post);
        final updatedPosts = currentState.posts.map((post) {
          return post.id == updatedPost.id ? updatedPost : post;
        }).toList();
        emit(PostUpdateSuccessState(posts: updatedPosts));
      } catch (e) {
        emit(PostErrorState(message: 'Failed to update post: ${e.toString()}'));
        emit(currentState); // Revert to previous state
      }
    });

    on<PostDeleteEvent>((event, emit) async {
      final currentState = state;
      if (currentState is! PostLoadSuccessState) return;

      emit(PostLoadingState());
      try {
        await remoteApiService.deletePost(event.id);
        final updatedPosts =
            currentState.posts.where((post) => post.id != event.id).toList();
        emit(PostDeleteSuccessState(posts: updatedPosts));
      } catch (e) {
        emit(PostErrorState(message: 'Failed to delete post: ${e.toString()}'));
        emit(currentState); // Revert to previous state
      }
    });
  }
}
