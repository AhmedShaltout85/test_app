
part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class PostLoadEvent extends PostEvent {}

class PostCreateEvent extends PostEvent {
  final Post post;
  PostCreateEvent({required this.post});
}

class PostUpdateEvent extends PostEvent {
  final Post post;
  PostUpdateEvent({required this.post});
}

class PostDeleteEvent extends PostEvent {
  final int id;
  PostDeleteEvent({required this.id});
}
