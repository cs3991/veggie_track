import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:veggie_track/theme/cubit/brightness_cubit.dart';
import 'package:veggie_track/theme/custom_colors.dart';

import 'calendar/ui/calendar_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hydrated bloc storage setup:
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  // navbar and statusbar color setup:
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BrightnessCubit()),
      ],
      child: BlocBuilder<BrightnessCubit, Brightness>(
        builder: (context, brightness) {
          final defaultTheme = ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF006c51),
            ),
            extensions: [
              CustomColors(
                veganColor: const Color(0xff5fd3b0),
                veggieColor: const Color(0xff6bc544),
                meatColor: const Color(0xffbc9834),
              )
            ],
          );
          return DynamicColorBuilder(
              builder: (lightDynamicColorScheme, darkDynamicColorScheme) =>
                  MaterialApp(
                    title: 'Veggie Track',
                    debugShowCheckedModeBanner: false,
                    theme: defaultTheme.copyWith(
                      colorScheme: lightDynamicColorScheme,
                      // brightness: Brightness.light,
                    ),
                    darkTheme: defaultTheme.copyWith(
                      colorScheme: darkDynamicColorScheme,
                      brightness: Brightness.dark,
                    ),
                    themeMode: brightness == Brightness.dark
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    home: CalendarPage(),
                  ));
        },
      ),
    );
  }
}