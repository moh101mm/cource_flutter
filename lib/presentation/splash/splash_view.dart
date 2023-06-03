import 'dart:async';

import 'package:clean_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_mvvm/presentation/resources/color_manager.dart';
import 'package:clean_mvvm/presentation/resources/routs_manager.dart';

import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;
  startDelay(){
    timer = Timer(const Duration(seconds: 5), goNext);
  }
  goNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoardinghRoute);
  }
  @override
  void initState(){
    super.initState();
    startDelay();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo,),))
    );
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }
}
