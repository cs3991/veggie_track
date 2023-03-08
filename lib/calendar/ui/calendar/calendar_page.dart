import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track/theme/ui/theme_chooser.dart';

import '../../bloc/month_days_bloc/month_days_bloc.dart';
import 'calendar_body.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

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
      body: const CalendarBody(),
    );
  }
}
