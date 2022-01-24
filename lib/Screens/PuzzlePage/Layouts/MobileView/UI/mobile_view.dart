import 'package:flutter/material.dart';
import 'package:puzzle_app/Declarations/Constants/constants.dart';
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
    return  Scaffold(
      body: const BuildBodyClass(),
       floatingActionButton: FloatingActionButton(
        onPressed: () =>(homePageNotifier.setArray()),
        backgroundColor: Theme.of(context).brightness.name == "dark"
          ?secondaryColor: primaryColor,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}