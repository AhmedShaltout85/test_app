
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/post.dart';
import '../../repo/remote_api_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  RemoteApiService remoteApiService = RemoteApiService();
   List<Post> _currentPosts = [];
  PostBloc() : super(PostLoadingState()) {
    on<PostLoadedEvent>((event, emit) async {
      // TODO: implement event handler
      //  if (event is PostLoadingEvent) {
      //   emit(PostLoadingState());
      // }else if (event is PostLoadedEvent) {
      //   emit(PostLoadedState(posts: event.posts));
      // }else if (event is PostCreatedEvent) {
      //   emit(PostCreatedState(post: event.post));
      // }else if (event is PostUpdatedEvent) {
      //   emit(PostUpdatedState(post: event.post));
      // }else if (event is PostDeletedEvent) {
      //   emit(PostDeletedState(postId: event.postId));
      // }else if (event is PostErrorEvent) {
      //   emit(PostErrorState(message: event.message));
      // }


      try {
        //get posts
        final posts = await remoteApiService.getPosts();
        _currentPosts = posts;
        emit(PostLoadedState(posts: posts));
      } catch (e) {
        emit(PostErrorState(message: e.toString()));
      }
    });
    //
    //
    on<PostCreatedEvent>((event, emit) async {
      try {
        //create post
        final post = await remoteApiService.createPost(event.post);

        emit(PostCreatedState(post: post));
      } catch (e) {
        emit(PostErrorState(message: e.toString()));
      }
    });
    //
    //
    on<PostUpdatedEvent>((event, emit) async {
      try {
        //update post
        final post = await remoteApiService.updatePost(event.post);

        emit(PostUpdatedState(post: post));
      } catch (e) {
        emit(PostErrorState(message: e.toString()));
      }
    });
    //
    //
    on<PostDeletedEvent>((event, emit) async {
      try {
        //delete post
        await remoteApiService.deletePost(event.id);
         _currentPosts.removeWhere((post) => post.id == event.id);
        emit(PostDeletedState(id: event.id));
      } catch (e) {
        emit(PostErrorState(message: e.toString()));
      }
    });
  }
}
