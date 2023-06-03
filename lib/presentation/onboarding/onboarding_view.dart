import 'package:clean_mvvm/presentation/resources/color_manager.dart';
import 'package:clean_mvvm/presentation/resources/constants_manager.dart';
import 'package:clean_mvvm/presentation/resources/routs_manager.dart';
import 'package:clean_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/string_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex =0;

  List<SliderObject> _getSliderData() =>[
    SliderObject(StringManager.onBoardingTitle1, StringManager.onBoardingSubTitle1,ImageAssets.onbordinglogo1 ),
    SliderObject(StringManager.onBoardingTitle2, StringManager.onBoardingSubTitle2,ImageAssets.onbordinglogo2 ),
    SliderObject(StringManager.onBoardingTitle3, StringManager.onBoardingSubTitle3,ImageAssets.onbordinglogo3 ),
    SliderObject(StringManager.onBoardingTitle4, StringManager.onBoardingSubTitle4,ImageAssets.onbordinglogo4 ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
          itemCount:_list.length,
          onPageChanged: (index){
          setState((){
            _currentIndex = index;
          });
          },
          itemBuilder: (context,index){
          return OnBoardingPage(_list[index]);
          
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
         children: [
           Align(
             alignment: Alignment.bottomRight,
             child: TextButton(
               onPressed: (){
                 Navigator.pushReplacementNamed(context, Routes.loginRoute);
               },
               child:  Text(StringManager.skip,style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.end,),
             ),
           ),
           _getBottomSheetWidget(),
         ],
        ),
      ),
    );
  }
  Widget _getBottomSheetWidget(){
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //right arrow
          Padding(padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.left_arrow_ic),
              ),
              onTap: (){
                _pageController.animateToPage(_getNextIndex(), duration: const Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.bounceInOut);
              },
            ) ,),
          Row(
            children: [
              for(int i = 0 ; i < _list.length ; i++)
                Padding(padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),)

            ],
          ),


          // lift arrow
          Padding(padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.right_arrow_ic),
              ),
              onTap: (){
                _pageController.animateToPage(_getPreviousIndex(), duration: const Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.bounceInOut);
              },
            ) ,),

        ],
      ),
    );
  }

  int _getPreviousIndex(){
    int previousIndex = -- _currentIndex ;
    if(previousIndex == -1){
      previousIndex = _list.length -1;
    }
    return previousIndex;
  }
  int _getNextIndex(){
    int nextIndex = ++ _currentIndex ;
    if(nextIndex == _list.length){
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index){
    if(index== _currentIndex){
      return SvgPicture.asset(ImageAssets.hollow_cirlce_ic);
    }else{
      return SvgPicture.asset(ImageAssets.solid_circle_ic);
    }
  }
  
  
}


class OnBoardingPage extends StatelessWidget {
   final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40,),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        const SizedBox(height: AppSize.s60,),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}


class SliderObject{
  String title;
  String subTitle;
  String image;
  SliderObject(this.title,this.subTitle,this.image);

}
