import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Import your Post model and Cubit
import '../model/post.dart';
import '../cubit/post_cubit.dart';

class UpdatePost extends StatefulWidget {
  final Post post; // Post to be updated
  const UpdatePost({super.key, required this.post});

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing post data
    _titleController = TextEditingController(text: widget.post.title);
    _contentController = TextEditingController(text: widget.post.body);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _updatePost() {
    if (_formKey.currentState!.validate()) {
      // Create updated post object
      final updatedPost = Post(
        id: widget.post.id, // Keep the same ID
        title: _titleController.text,
        body: _contentController.text,
        userId: 1
        // Include other necessary fields
      );

      // Call update method from your cubit
      context.read<PostCubit>().updatePost(updatedPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Post'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _updatePost,
          ),
        ],
      ),
      body: BlocListener<PostCubit, PostState>(
        listener: (context, state) {
          // Handle success state - when update is complete
          if (state is PostLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Post updated successfully!')),
            );
            Navigator.pop(context); // Go back after successful update
          }

          // Handle error state
          if (state is PostError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some content';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state is PostLoading ? null : _updatePost,
                        child: state is PostLoading
                            ? const CircularProgressIndicator()
                            : const Text('Update Post'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// // In your posts list where you display each post
// ListTile(
//   title: Text(post.title),
//   subtitle: Text(post.content),
//   trailing: IconButton(
//     icon: Icon(Icons.edit),
//     onPressed: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => UpdatePost(post: post),
//         ),
//       );
//     },
//   ),
// ),