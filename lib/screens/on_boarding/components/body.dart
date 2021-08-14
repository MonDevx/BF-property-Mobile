import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.toNamed("/signin");
  }

  Widget _buildImage(String assetName, double d) {
    return Align(
      child:
          Image.asset('assets/images/$assetName.png', width: 250.0, height: d),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);

    var pageDecoration = PageDecoration(
      titleTextStyle: themeData.textTheme.headline6,
      bodyTextStyle: themeData.textTheme.bodyText1,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: themeData.scaffoldBackgroundColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: labels?.onboarding?.titlelabel1,
          body: labels?.onboarding?.bodylabel1,
          image: _buildImage('img1', 190.0),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: labels?.onboarding?.titlelabel2,
          body: labels?.onboarding?.bodylabel2,
          image: _buildImage('img2', 200.0),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: labels?.onboarding?.titlelabel3,
          body: labels?.onboarding?.bodylabel3,
          image: _buildImage('img3', 200.0),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('${labels?.onboarding?.buttonskip}'),
      next: const Icon(Icons.arrow_forward),
      globalBackgroundColor: themeData.scaffoldBackgroundColor,
      done: Text('${labels?.onboarding?.buttoncompleted}',
          style: themeData.textTheme.bodyText1),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
