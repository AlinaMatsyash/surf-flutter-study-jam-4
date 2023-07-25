import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/theme/app_typography.dart';

import '../features/change_theme/presentation/bloc/theme_bloc.dart';
import '../res/assets/colors.gen.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.green),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Change theme',
                    style: AppTypography.dillSansRegular32.copyWith(
                        color: themeData == ThemeData.dark()
                            ? ColorName.textDark
                            : ColorName.textLight),
                  ),
                  SizedBox(height: 15.h),
                  CupertinoSwitch(
                      activeColor: Colors.green,
                      value: themeData == ThemeData.dark(),
                      onChanged: (bool val) {
                        context.read<ThemeBloc>().add(SwitchEvent());
                      }),
                  SizedBox(height: 15.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
