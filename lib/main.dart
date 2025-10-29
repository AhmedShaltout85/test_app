// // import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test_app/counter_training_bloc_cubit/bloc/counter_bloc.dart';

// import 'bloc_training/cubit/post_cubit.dart';
// import 'bloc_training/view/login_to_post.dart';
import 'bloc_training/bloc/bloc/post_bloc.dart';
// import 'bloc_training/view/post_with_bloc.dart';
import 'bloc_training/view/stack_container.dart';
// import 'counter_training_bloc_cubit/bloc/counter_view.dart';
// import 'bloc_training/view/post_view.dart';

// import 'view/hydraulic_pump.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: MaterialApp(
        title: 'Posts App with BLoC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const StackContainer(),
        // home: const PostsPage(),
      ),

      // return MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: 'Training Bloc and Cubit',
      //   theme: ThemeData(
      //     primarySwatch: Colors.blue,
      //     useMaterial3: true,
      //   ),
      //   home: BlocProvider(
      //     create: (context) => PostBloc(),
      //     child: const PostsPage(),
      //   ),

      // home: BlocProvider(
      //   create: (_) => CounterBloc(),
      //   child: const CounterBolcView(),
      //   // create: (_) => CounterCubit(),
      //   // child: const CounterView(),
      //   // create: (_) => PostCubit()..getPosts(),
      //   // child: LoginToPost(),
      //   // child: const PostView(),
      // ),
      // const HydraulicPumpChecklist(),
    );
  }
}
