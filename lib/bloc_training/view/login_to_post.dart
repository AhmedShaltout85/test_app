import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/post_cubit.dart';
import '../model/post.dart';

class LoginToPost extends StatelessWidget {
  const LoginToPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login To Post'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Show loading indicator when creating post
              if (state is PostLoading) const CircularProgressIndicator(),

              // Show error message if any
              if (state is PostError)
                Text('Error: ${state.message}',
                    style: const TextStyle(color: Colors.red)),

              // Show success message if post was created
              if (state is PostLoaded && state.posts.isNotEmpty)
                const Text('Post created successfully!',
                    style: TextStyle(color: Colors.green)),

              MaterialButton(
                onPressed: () {
                  // Create a Post object with your data
                  final post = Post(
                    title: 'Title',
                    body: 'Body',
                    userId: 1,
                    id: 1,
                  );

                  context.read<PostCubit>().createPost(post);
                  log('Post created');
                },
                child: const Text('Create Post'),
              ),

              // Display created posts
              if (state is PostLoaded)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      final post = state.posts[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
