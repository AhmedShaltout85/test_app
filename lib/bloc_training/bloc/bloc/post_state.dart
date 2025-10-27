part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitialState extends PostState {}

final class PostLoadingState extends PostState {}

final class PostLoadSuccessState extends PostState {
  final List<Post> posts;
  PostLoadSuccessState({required this.posts});
}

final class PostCreateSuccessState extends PostState {
  final List<Post> posts;
  PostCreateSuccessState({required this.posts});
}

final class PostUpdateSuccessState extends PostState {
  final List<Post> posts;
  PostUpdateSuccessState({required this.posts});
}

final class PostDeleteSuccessState extends PostState {
  final List<Post> posts;
  PostDeleteSuccessState({required this.posts});
}

final class PostErrorState extends PostState {
  final String message;
  PostErrorState({required this.message});
}


