part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class PostLoadingEvent extends PostEvent {}

class PostLoadedEvent extends PostEvent {
  final List<Post> posts;
  PostLoadedEvent({required this.posts});
}

class PostCreatedEvent extends PostEvent {
  final Post post;
  PostCreatedEvent({required this.post});
}
class PostUpdatedEvent extends PostEvent {
  final Post post;
  PostUpdatedEvent({required this.post});
}

class PostDeletedEvent extends PostEvent {
  final int id;
  PostDeletedEvent({required this.id});
}
class PostErrorEvent extends PostEvent {
  final String message;
  PostErrorEvent({required this.message});
}
