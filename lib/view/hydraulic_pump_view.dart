import 'package:flutter/material.dart';

import '../common_widgets/uitls/frosted_glass_service.dart';

class HydraulicPumpChecklistView extends StatelessWidget {
  const HydraulicPumpChecklistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 96, 88, 88).withOpacity(0.2),
      body: const Center(
        child: FrostedGlass(
          blur: 15,
          opacity: 0.3,
          child: Text(
            'Frosted Glass',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
