import 'package:flutter/material.dart';

import '../../../../../ValueNotifier/homepage_notifier.dart';
import '../Widgets/1body.dart';

class MobileViewLayout extends StatefulWidget {
  const MobileViewLayout({Key? key}) : super(key: key);

  @override
  State<MobileViewLayout> createState() => _MobileViewLayoutState();
}

class _MobileViewLayoutState extends State<MobileViewLayout> {
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