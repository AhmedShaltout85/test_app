import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // final int index;
  const DetailScreen({
    super.key,
    // required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Detail Screen',
                  style: TextStyle(color: Colors.white)),
              background: Image.asset(
                'assets/images/img1.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item #$index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
