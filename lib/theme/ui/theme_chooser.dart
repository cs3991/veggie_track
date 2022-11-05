import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../brightness_cubit.dart';

class ThemeSwitcherIcon extends StatelessWidget {
  const ThemeSwitcherIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<BrightnessCubit, Brightness>(
        builder: (context, brightness) {
          return Icon(
            brightness == Brightness.dark
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded,
            color: Theme.of(context).colorScheme.onSurface,
          );
        },
      ),
      onPressed: () {
        BlocProvider.of<BrightnessCubit>(context).switchBrightness();
      },
    );
  }
}
