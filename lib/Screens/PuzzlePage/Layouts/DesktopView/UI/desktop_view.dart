import 'package:flutter/material.dart';

import '../../../../../ValueNotifier/homepage_notifier.dart';
import '../Widgets/1body.dart';

class DeskTopViewLayout extends StatefulWidget {
  const DeskTopViewLayout({Key? key}) : super(key: key);

  @override
  State<DeskTopViewLayout> createState() => _DeskTopViewLayoutState();
}

class _DeskTopViewLayoutState extends State<DeskTopViewLayout> {
  @override
  void initState() {
    homePageNotifier.setArray();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  BuildBodyClass(),
    );
  }
}