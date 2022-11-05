import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:veggie_track/theme/brightness_cubit.dart';
import 'package:veggie_track/theme/ui/theme_chooser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hydrated bloc storage setup:
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  // navbar and statusbar color setup:
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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
          return DynamicColorBuilder(
              builder: (lightColorScheme, darkColorScheme) => MaterialApp(
                    title: 'Veggie Track',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      useMaterial3: true,
                      colorScheme: lightColorScheme,
                    ),
                    darkTheme: ThemeData(
                      useMaterial3: true,
                      colorScheme: darkColorScheme,
                    ),
                    themeMode: brightness == Brightness.dark
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    home: const MyHomePage(),
                  ));
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        title: Text('Veggie Track'),
        actions: [
          ThemeSwitcherIcon(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
