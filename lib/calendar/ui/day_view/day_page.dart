import 'package:flutter/material.dart';

import 'day_body.dart';

class DayPage extends StatelessWidget {
  const DayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: DayBody(),
    );
  }
}
