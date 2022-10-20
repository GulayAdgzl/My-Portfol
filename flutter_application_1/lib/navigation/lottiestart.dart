import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constant/lottie_items.dart';
import 'package:lottie/lottie.dart';

import '../product/navigator/navigator_routes.dart';

class LottieWeb extends StatefulWidget {
  const LottieWeb({Key? key}) : super(key: key);

  @override
  State<LottieWeb> createState() => _LottieWebState();
}

class _LottieWebState extends State<LottieWeb> {
  @override
  initState() {
    super.initState();
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    // await Future.delayed(Duration(seconds: 10));
    await Future.delayed(_DurationUtility._duraionLow);

    Navigator.of(context).pushNamed(NavigateRouters.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _LottieWeb(),
    );
  }
}

class _LottieWeb extends StatelessWidget {
  const _LottieWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(LottieItems.themeChange.lottiePath));
  }
}

class _DurationUtility {
  static const _duraionLow = const Duration(seconds: 8);
}
