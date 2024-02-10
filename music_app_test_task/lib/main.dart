import 'package:flutter/material.dart';
import 'core/injector.dart' as di;
// import 'core/injector.dart';
import 'navigation/go_rounter.dart';

final _router = di.getIt.get<GoRouterNavigation>().initGoRoute();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.InjectionContainer.initDependencyInjection();
  // await InjectionContainer.registerHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: GlobalKey(),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
