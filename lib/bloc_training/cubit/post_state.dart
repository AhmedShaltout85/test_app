part of 'post_cubit.dart';


abstract class PostState {}

 class PostLoading extends PostState {}

 class PostLoaded extends PostState {
   final List<Post> posts;
   PostLoaded({required this.posts});
 }

 class PostError extends PostState {
   final String message;
   PostError({required this.message});
 }

class PostDeleted extends PostState {
  final int id;
  PostDeleted({required this.id});
}
