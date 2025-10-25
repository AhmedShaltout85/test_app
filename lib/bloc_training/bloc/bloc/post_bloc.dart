
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/post.dart';
import '../../repo/remote_api_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final RemoteApiService remoteApiService = RemoteApiService();
  List<Post> _currentPosts = [];

  PostBloc() : super(PostInitialState()) {
    on<PostLoadEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final posts = await remoteApiService.getPosts();
        _currentPosts = posts;
        emit(PostLoadSuccessState(posts: _currentPosts));
      } catch (e) {
        emit(PostErrorState(message: 'Failed to load posts: ${e.toString()}'));
      }
    });

    on<PostCreateEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final newPost = await remoteApiService.createPost(event.post);
        _currentPosts.add(newPost);
        emit(PostCreateSuccessState(posts: _currentPosts));
      } catch (e) {
        emit(PostErrorState(message: 'Failed to create post: ${e.toString()}'));
        // Reload the original posts on error
        emit(PostLoadSuccessState(posts: _currentPosts));
      }
    });

    on<PostUpdateEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final updatedPost = await remoteApiService.updatePost(event.post);
        final index =
            _currentPosts.indexWhere((post) => post.id == updatedPost.id);
        if (index != -1) {
          _currentPosts[index] = updatedPost;
        }
        emit(PostUpdateSuccessState(posts: _currentPosts));
      } catch (e) {
        emit(PostErrorState(message: 'Failed to update post: ${e.toString()}'));
        // Reload the original posts on error
        emit(PostLoadSuccessState(posts: _currentPosts));
      }
    });

    on<PostDeleteEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        await remoteApiService.deletePost(event.id);
        _currentPosts.removeWhere((post) => post.id == event.id);
        emit(PostDeleteSuccessState(posts: _currentPosts));
      } catch (e) {
        emit(PostErrorState(message: 'Failed to delete post: ${e.toString()}'));
        // Reload the original posts on error
        emit(PostLoadSuccessState(posts: _currentPosts));
      }
    });
  }
}
