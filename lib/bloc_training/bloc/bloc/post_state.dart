part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostLoadingState extends PostState {}

final class PostLoadedState extends PostState {
  final List<Post> posts;
  PostLoadedState({required this.posts});
}

final class PostErrorState extends PostState {
  final String message;
  PostErrorState({required this.message});
}

final class PostCreatedState extends PostState {
  final Post post;
  PostCreatedState({required this.post});
}

final class PostUpdatedState extends PostState {
  final Post post;
  PostUpdatedState({required this.post});
}

final class PostDeletedState extends PostState {
  final int id;
  PostDeletedState({required this.id});
}