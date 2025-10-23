import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/post_cubit.dart';
import '../model/post.dart';

class LoginToPost extends StatelessWidget {
  LoginToPost({super.key});
  // Add these as class variables
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Login To Post', style: TextStyle(color: Colors.purple)),
        centerTitle: true,
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
              // In your Column
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _bodyController,
                  decoration: const InputDecoration(labelText: 'Body'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    if (_titleController.text.isNotEmpty ||
                        _bodyController.text.isNotEmpty) {
                      final post = Post(
                        title: _titleController.text,
                        body: _bodyController.text,
                        userId: 1,
                        // id: 1,
                      );
                      context.read<PostCubit>().createPost(post);
                      log('LOGGER CREATE POST: ${post.title}, ${post.body}');
                    } else {
                      log('LOGGER ERROR CREATE POST: one or more Textfield is empty');
                    }
                  },
                  child: const Text('Create Post',
                      style: TextStyle(color: Colors.white)),
                ),
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
