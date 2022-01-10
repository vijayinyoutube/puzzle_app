import 'package:flutter/material.dart';
import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '../Widgets/1body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    homePageNotifier.setArray();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SingleChildScrollView(child: BuildBodyClass())),
    );
  }
}
