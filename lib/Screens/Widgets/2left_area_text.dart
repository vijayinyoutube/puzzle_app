import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../Declarations/Constants/constants.dart';
import '../../Declarations/Images/image_files.dart';
import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '../../Widgets/g_widgets.dart';

class LeftTextAreaClass extends StatefulWidget {
  const LeftTextAreaClass({Key? key}) : super(key: key);

  @override
  State<LeftTextAreaClass> createState() => _LeftTextAreaClassState();
}

class _LeftTextAreaClassState extends State<LeftTextAreaClass>
    with TickerProviderStateMixin {
  late Animation colorAnimation;
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    colorAnimation = ColorTween(begin: primaryColor, end: secondaryColor)
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageNotifier.n,
        builder: (context, value, _) {
          return buildlefttext();
        });
  }

  Widget buildlefttext() => SizedBox(
        // color: Colors.pink,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: BuildImage(path:images[0])),
            Expanded(
              flex: 6,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 3.5, height: 225, color: hoverColor),
                    const WidthSpacer(myWidth: 25.00),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 55,
                          child: Row(
                            children: [
                              const FlutterLogo(
                                size: 40,
                              ),
                              Text(
                                "Flutter",
                                style: TextStyle(
                                    color: secondaryColor, fontSize: 30),
                              ),
                              const WidthSpacer(myWidth: 10.00),
                              Container(
                                  width: 2.5,
                                  height: 35,
                                  color: secondaryColor),
                              const WidthSpacer(myWidth: 10.00),
                              buildAnimatedText(),
                            ],
                          ),
                        ),
                        const HeightSpacer(myHeight: 10.00),
                        Text(
                          "#PuzzleChallenge",
                          style: TextStyle(
                            color: colorAnimation.value,
                            fontSize: 50,
                          ),
                        ),
                        const HeightSpacer(myHeight: 15.00),
                        Row(
                          children: [
                            buildButtom(
                                175,
                                const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: kPadding * 1.5,
                                  child: const Text(
                                    "Shuffle",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                secondaryColor,
                                () => homePageNotifier.setArray()),
                            const WidthSpacer(myWidth: 15.00),
                            buildButtom(
                                250,
                                const Padding(
                                  padding: EdgeInsets.only(right: 9.0),
                                  child: Text(
                                    "Level",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                Padding(
                                    padding: kPadding * 0.32,
                                    child: buildFontStyleDropDownMenu()),
                                primaryColor,
                                () => {}),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: BuildImage(path:images[1])),
          ],
        ),
      );

  Widget buildAnimatedText() => Padding(
        padding: const EdgeInsets.only(top: 1.5),
        child: AnimatedTextKit(
          animatedTexts: [
            for (var i = 0; i < HomePageRepo().pltforms.length; i++)
              buildText(i),
          ],
          repeatForever: true,
          pause: const Duration(milliseconds: 50),
        ),
      );

  buildText(int index) {
    return RotateAnimatedText(
      HomePageRepo().pltforms[index],
      textStyle: TextStyle(
        fontSize: 30.0,
        color: secondaryColor,
      ),
    );
  }

  Widget buildButtom(double width, Widget child1, Widget child2,
          Color containerColor, Function myFunction) =>
      GestureDetector(
        onTap: () => myFunction(),
        child: Container(
          width: width,
          decoration:
              BoxDecoration(borderRadius: kBorder, color: containerColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child1,
              child2,
            ],
          ),
        ),
      );

  Widget buildFontStyleDropDownMenu() => DropdownButton<String>(
        alignment: Alignment.center,
        value: HomePageRepo().levels[homePageNotifier.n.value],
        underline: Container(height: 2, color: Colors.white),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 24,
        elevation: 16,
        items: HomePageRepo().levels.entries.map((items) {
          return DropdownMenuItem<String>(
            value: items.value,
            child: Text(
              items.value,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 20,
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          var keys = HomePageRepo().levels.entries.firstWhere((element) {
            return element.value == newValue;
          });
          homePageNotifier.updateNVal(ValueNotifier(keys.key));
        },
      );


}
