import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technupur_abdullha/services/navigation/locator.dart';
import 'package:technupur_abdullha/splash_page.dart';
import './services/navigation/router.dart' as routes;
import 'home_page/view_model/home_page_provider.dart';
import 'services/navigation/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomePageProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: routes.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
