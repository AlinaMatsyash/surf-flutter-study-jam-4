import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/features/animation/presentation/widgets/ball_ripple.dart';
import 'package:surf_practice_magic_ball/res/assets/assets.gen.dart';

import '../../../change_theme/presentation/bloc/theme_bloc.dart';

class BallLoadingWidget extends StatefulWidget {
  const BallLoadingWidget({super.key});

  @override
  State<BallLoadingWidget> createState() => _BallLoadingWidgetState();
}

class _BallLoadingWidgetState extends State<BallLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controllerShaking;
  final Tween<double> _tween = Tween(begin: 0.75, end: 2);

  @override
  void initState() {
    super.initState();
    controllerShaking = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controllerShaking.isCompleted) {
          controllerShaking.repeat();
        }
      });
  }

  @override
  void dispose() {
    controllerShaking.dispose();
    super.dispose();
  }

  double shake(double value) =>
      2 * (0.5 - (0.5 - Curves.bounceOut.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controllerShaking,
      builder: (context, child) => Transform.translate(
        offset: Offset(10.h * shake(controllerShaking.value), 0),
        child: child,
      ),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, themeData) {
          return Stack(
            alignment: Alignment.center,
            children: [
              themeData == ThemeData.dark()
                  ? Assets.images.ballDark.image()
                  : Assets.images.ballLight2.image(),
              Assets.images.star.image(),
              const BallRipple(),
            ],
          );
        },
      ),
    );
  }
}
