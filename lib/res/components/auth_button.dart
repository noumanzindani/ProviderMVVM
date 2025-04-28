import 'package:app/res/components/app_color.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthButton extends StatelessWidget {
  final String? buttontext;
  final bool loading;
  final VoidCallback onPress;
  const AuthButton({super.key, required this.buttontext,required this.loading,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color:AppColor.black),
        child: Center(
          child:loading?CustomLoadingAnimation(): Text(
            buttontext.toString(),
            style: TextStyle(color: AppColor.white),
          )
        ),
      ),
    );
  }
}


class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.white,
      size: MediaQuery.sizeOf(context).height*0.02,
    );
  }
}
