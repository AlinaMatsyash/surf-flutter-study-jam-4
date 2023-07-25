import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/features/change_theme/presentation/bloc/theme_bloc.dart';
import 'package:surf_practice_magic_ball/res/assets/assets.gen.dart';

import '../../../get_fate/presentation/bloc/fate_bloc.dart';

class BallEmptyWidget extends StatefulWidget {
  const BallEmptyWidget({super.key});

  @override
  State<BallEmptyWidget> createState() => _BallEmptyWidgetState();
}

class _BallEmptyWidgetState extends State<BallEmptyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controllerFloating;

  @override
  void initState() {
    super.initState();
    controllerFloating = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controllerFloating.isCompleted) {
          controllerFloating.repeat();
        }
      });
  }

  @override
  void dispose() {
    controllerFloating.dispose();
    super.dispose();
  }

  double shake(double value) =>
      2 * (0.5 - (0.5 - Curves.bounceOut.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controllerFloating,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, 24.h * shake(controllerFloating.value)),
        child: child,
      ),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<FateBloc>(context).add(GetFateEvent());
        },
        child: BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, themeData) {
            return Stack(
              alignment: Alignment.center,
              children: [
                themeData == ThemeData.dark()
                    ? Assets.images.ballDark.image()
                    : Assets.images.ballLight2.image(),
                Assets.images.star.image(),
                Assets.images.smallStar.image()
              ],
            );
          },
        ),
      ),
    );
  }
}
