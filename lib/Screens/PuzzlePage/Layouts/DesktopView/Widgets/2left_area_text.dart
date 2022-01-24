import 'package:flutter/material.dart';
import '../../../../../Declarations/Constants/constants.dart';
import '../../../../../Declarations/Images/image_files.dart';
import '../../../../../ValueNotifier/homepage_notifier.dart';
import '../../../../../Widgets/1g_widgets.dart';
import '../../../../../Widgets/animated_text.dart';
import '../../../../../Widgets/level_dropdown_btn.dart';
import '../../../../../Widgets/shuffle_btn.dart';
import '../../../../../Widgets/tween_text_animation.dart';

class LeftTextAreaClass extends StatelessWidget {
  const LeftTextAreaClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageNotifier.n,
        builder: (context, value, _) {
          return buildlefttext(context);
        });
  }

  Widget buildlefttext(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: BuildImage(path: images[0])),
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
                        const AnimatedTextClass(),
                        const HeightSpacer(myHeight: 10.00),
                        const TweenAnimationClass(),
                        const HeightSpacer(myHeight: 15.00),
                        Row(
                          children: const [
                            ShuffleBtn(),
                            WidthSpacer(myWidth: 15.00),
                            LevelBtn(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: BuildImage(path: images[1])),
          ],
        ),
      );
}
