import 'package:bloc/bloc.dart';

import '../model/post.dart';
import '../repo/remote_repo_api.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoading());

  Future<void> getPosts() async {
    try {
      final posts = await RemoteRepoApi().getPosts();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }
}
