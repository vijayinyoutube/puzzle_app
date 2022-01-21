import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

import '../Declarations/Constants/constants.dart';
import '../Repository/homepage.dart';

class DayNightSwitch extends StatefulWidget {
  const DayNightSwitch({Key? key}) : super(key: key);

  @override
  State<DayNightSwitch> createState() => _DayNightSwitch();
}

class _DayNightSwitch extends State<DayNightSwitch> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomePageRepo().getTheme(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: 65,
            child: DayNightSwitcher(
              isDarkModeEnabled: isDarkMode,
              onStateChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                  HomePageRepo().saveTheme(isDarkMode);
                  HomePageRepo().getTheme();
                });
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      });
  }
}