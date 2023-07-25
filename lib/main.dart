import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/features/change_theme/presentation/bloc/theme_bloc.dart';
import 'package:surf_practice_magic_ball/injection_container.dart';
import 'core/info.dart';
import 'features/get_fate/presentation/bloc/fate_bloc.dart';
import 'screen/magic_ball_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
  if (kIsWeb) {
    web = true;
  } else if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android) {
    mobile = true;
  } else if (defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.fuchsia) {
    desktop = true;
  } else {}
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: mobile
          ? const Size(375, 812)
          : desktop
              ? const Size(1440, 1024)
              : const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThemeBloc()..add(InitialEvent()),
            ),
            BlocProvider(
              create: (_) => sl<FateBloc>(),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: state,
                home: const MagicBallScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
