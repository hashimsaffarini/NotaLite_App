import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/routing/routes.dart';
import 'package:to_do/core/theming/styles.dart';
import 'package:to_do/core/utils/app_images.dart';

class OnboardingScreenAppBar extends StatelessWidget {
  const OnboardingScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 21,
        right: 36,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Assets.imagesAppIcon,
                width: 70.w,
                height: 70.h,
              ),
              Text(
                'NotaLite',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Routes.homePage);
                },
                child: Text(
                  'Skip',
                  style: TextStyles.font20BlackRegular.copyWith(
                    color: Colors.black.withOpacity(0.800000011920929),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
