// // import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_training/cubit/post_cubit.dart';
import 'bloc_training/view/login_to_post.dart';
// import 'bloc_training/view/post_view.dart';



// import 'view/hydraulic_pump.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hydraulic Pump Checklist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BlocProvider(
        // create: (_) => CounterCubit(),
        // child: const CounterView(),
        create: (_) => PostCubit()..getPosts(),
        child: const LoginToPost(),
        // child: const PostView(),
      ),
      // const HydraulicPumpChecklist(),
    );
  }
}
