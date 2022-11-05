import 'package:flutter/material.dart';
import 'package:veggie_track/theme/custom_colors.dart';
import 'package:veggie_track/theme/ui/theme_chooser.dart';

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
      body: Column(
        children: [
          ColoredBox(
            color: Theme.of(context).extension<CustomColors>()!.meatColor,
            child: const Text('Meat'),
          ),
          ColoredBox(
            color: Theme.of(context).extension<CustomColors>()!.veggieColor,
            child: const Text('Veggie'),
          ),
          ColoredBox(
            color: Theme.of(context).extension<CustomColors>()!.veganColor,
            child: const Text('Vegan'),
          ),
        ],
      ),
    );
  }
}
