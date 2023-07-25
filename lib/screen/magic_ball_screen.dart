import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/core/info.dart';
import 'package:surf_practice_magic_ball/features/change_theme/presentation/bloc/theme_bloc.dart';
import 'package:surf_practice_magic_ball/res/assets/assets.gen.dart';
import 'package:surf_practice_magic_ball/res/assets/colors.gen.dart';
import 'package:surf_practice_magic_ball/screen/settings_screen.dart';
import 'package:surf_practice_magic_ball/theme/app_typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';

import '../features/get_fate/presentation/bloc/fate_bloc.dart';
import '../features/animation/presentation/widgets/ball_empty.dart';
import '../features/animation/presentation/widgets/ball_loading.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(onPhoneShake: () {
      BlocProvider.of<FateBloc>(context).add(GetFateEvent());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, themeData) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: themeData == ThemeData.dark()
                      ? [
                          ColorName.gradientDarkOne,
                          ColorName.gradientDarkTwo,
                        ]
                      : [
                          ColorName.gradientLightOne,
                          ColorName.gradientLightTwo,
                        ],
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SafeArea(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Setting()));
                        },
                        icon: Icon(
                          Icons.settings,
                          color: themeData == ThemeData.dark()
                              ? ColorName.textDark
                              : ColorName.textLight, size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mobile ? 144.h : 2.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: mobile ? 1.w : 387.w),
                    child: SizedBox(
                      height: mobile ? 319.h : 664.h,
                      width: mobile ? 319.w : 665.w,
                      child: BlocBuilder<FateBloc, FateState>(
                        builder: (context, state) {
                          if (state is EmptyState) {
                            return BallEmptyWidget();
                          } else if (state is LoadingState) {
                            return BallLoadingWidget();
                          } else if (state is LoadedState) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<FateBloc>(context)
                                    .add(GetFateEvent());
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  themeData == ThemeData.dark()
                                      ? Assets.images.ballDark.image()
                                      : Assets.images.ballLight2.image(),
                                  Assets.images.star.image(),
                                  Assets.images.smallStar.image(),
                                  themeData == ThemeData.dark()
                                      ? Assets.images.darkArea.image()
                                      : Assets.images.lightArea2.image(),
                                  SizedBox(
                                    width: mobile ? 200.w : 402.w,
                                    child: Text(
                                      state.fate
                                          .toString()
                                          .replaceAll('MagicBallFateModel(', '')
                                          .replaceAll(".)", ""),
                                      style: AppTypography.dillSansRegular32
                                          .copyWith(
                                              color:
                                                  themeData == ThemeData.dark()
                                                      ? ColorName.white
                                                      : ColorName.textLight),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else if (state is ErrorState) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                themeData == ThemeData.dark()
                                    ? Assets.images.redBallDark.image()
                                    : Assets.images.redBallLight.image(),
                                Assets.images.star.image(),
                                Assets.images.smallStar.image(),
                                SizedBox(
                                  width: mobile ? 250.w : 402.w,
                                  child: Text(
                                    state.message,
                                    style: AppTypography.dillSansRegular32
                                        .copyWith(color: ColorName.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: mobile ? 76.h : 60.h),
                  SizedBox(
                    height: mobile ? 42.h : 94.h,
                    child: BlocBuilder<FateBloc, FateState>(
                      builder: (context, state) {
                        if (state is EmptyState &&
                            state is LoadingState &&
                            state is LoadedState) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: themeData == ThemeData.dark()
                                ? [
                                    Assets.images.ellipseBigBlue.image(),
                                    Assets.images.ellipseSmallBlue.image(),
                                  ]
                                : [
                                    Assets.images.ellipseBigLight.image(),
                                    Assets.images.ellipseSmallLight.image(),
                                  ],
                          );
                        } else if (state is ErrorState) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Assets.images.ellipseSmallRed.image(),
                              Assets.images.ellipseBigRed.image(),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  SizedBox(height: mobile ? 29.h : 31.h),
                  Text(
                    mobile
                        ? 'Нажмите на шар\nили потрясите телефон'
                        : 'Нажмите на шар',
                    style: mobile ?  AppTypography.dillSansRegular16.copyWith(
                        color: themeData == ThemeData.dark()
                            ? ColorName.textDark
                            : ColorName.textLight) :  AppTypography.dillSansRegular32.copyWith(
                        color: themeData == ThemeData.dark()
                            ? ColorName.textDark
                            : ColorName.textLight),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
