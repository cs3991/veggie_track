import 'package:flutter/material.dart';
import 'package:veggie_track/theme/ui/theme_chooser.dart';

import 'calendar_body.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Veggie Track'),
        actions: const [
          ThemeSwitcherIcon(),
        ],
      ),
      body: CalendarBody(),
    );
  }
}
