import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildBodyClass extends StatelessWidget {
  const BuildBodyClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: Theme.of(context).brightness.name == "light"
                  ? [HexColor("9ED1FF"), HexColor("FFFFFF")]
                  : [HexColor("#01407a"), HexColor("000000")])),
      height: double.infinity,
      child: SingleChildScrollView(
          child: Stack(
        alignment: Alignment.center,
      )),
    );
  }
}
