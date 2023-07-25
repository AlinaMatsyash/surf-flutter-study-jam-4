import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/core/info.dart';
import 'package:surf_practice_magic_ball/res/assets/assets.gen.dart';

import '../../../change_theme/presentation/bloc/theme_bloc.dart';

class BallRipple extends StatefulWidget {
  const BallRipple({Key? key}) : super(key: key);


  @override
  State<BallRipple> createState() => _BallRippleState();
}

class _BallRippleState extends State<BallRipple>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  final Tween<double> _tween = Tween(begin: 0.1, end: 1);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _tween.animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutSine)),
        child: BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, themeData) {
            return SizedBox(
                height: mobile ? 270.h : 583.h,
                width: mobile ? 270.w : 583.w,
                child:  themeData == ThemeData.dark() ? Assets.images.darkArea.image() : Assets.images.lightArea2.image());
          },
        ));
  }
}
