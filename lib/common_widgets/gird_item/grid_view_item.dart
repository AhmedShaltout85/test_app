import 'dart:developer';

import 'package:flutter/material.dart';

import '../../bloc_training/view/detail_screen.dart';

class GridViewCardItem extends StatelessWidget {
  const GridViewCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      itemBuilder: (context, index) {
        return GridTile(
          footer: GridTileBar(
            title: Container(
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  // Handle tap event
                  log('Tapped on item $index');
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ));
                },
                child: const Text(
                  'hotel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/img1.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: 12,
    );
  }
}
