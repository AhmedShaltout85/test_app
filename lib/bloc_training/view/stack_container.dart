import 'package:flutter/material.dart';

import '../../common_widgets/gird_item/grid_view_item.dart';

class StackContainer extends StatelessWidget {
  const StackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          title: const Text(
            'Stack Container',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true),
      body: const Padding(
        padding: EdgeInsets.all(18.0),
        child: GridViewCardItem(),
      ),
      // body: Center(
      //     child: Column(
      //   children: [
      //     SizedBox(
      //       // Constrain the outer container
      //       width: 194,
      //       height: 231,
      //       child: Container(
      //         alignment: Alignment.bottomCenter,
      //         decoration: BoxDecoration(
      //           image: const DecorationImage(
      //             image: AssetImage('assets/images/img1.jpeg'),
      //             fit: BoxFit.cover,
      //           ),
      //           borderRadius: BorderRadius.circular(12),
      //         ),
      //         child: Container(
      //           // Inner container
      //           width: 150,
      //           height: 50,
      //           margin: const EdgeInsets.only(bottom: 20),
      //           padding: const EdgeInsets.all(8.0),
      //           decoration: BoxDecoration(
      //             color: Colors.blue,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: const Center(
      //             child: Text(
      //               'Stack Container',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // )
      // Container(
      //   width: 194,
      //   height: 231,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/img1.jpeg'),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Container(
      //       width: 150,
      //       height: 50,
      //       margin: const EdgeInsets.only(bottom: 20),
      //       decoration: BoxDecoration(
      //         color: Colors.blue,
      //         borderRadius: BorderRadius.circular(
      //           20,
      //         ),
      //       ),
      //       child: const Center(
      //         child: Text(
      //           'Stack Container',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 16,
      //             fontWeight: FontWeight.w700,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // ),
    );
  }
}
