import 'package:flutter/material.dart';
import 'package:technupur_abdullha/services/navigation/navigation_object.dart';
import 'package:technupur_abdullha/services/navigation/router_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        navigationService.navigateTo(RouterPath.home_page);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/splash_screen.png'),
    );
  }
}
