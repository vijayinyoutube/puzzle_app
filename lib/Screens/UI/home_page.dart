import 'package:flutter/material.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '../Widgets/1body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
 

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
