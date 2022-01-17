import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({Key? key, required this.myWidth}) : super(key: key);
  final double myWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: myWidth);
  }
}

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({Key? key, required this.myHeight}) : super(key: key);
  final double myHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: myHeight);
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({Key? key, required this.path}) : super(key: key);

  final String path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
    );
  }
}
