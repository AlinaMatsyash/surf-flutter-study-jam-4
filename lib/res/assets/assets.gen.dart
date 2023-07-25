/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsColorsGen {
  const $AssetsColorsGen();

  /// File path: assets/colors/colors.xml
  String get colors => 'assets/colors/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ball_dark.png
  AssetGenImage get ballDark =>
      const AssetGenImage('assets/images/ball_dark.png');

  /// File path: assets/images/ball_light2.png
  AssetGenImage get ballLight2 =>
      const AssetGenImage('assets/images/ball_light2.png');

  /// File path: assets/images/dark_area.png
  AssetGenImage get darkArea =>
      const AssetGenImage('assets/images/dark_area.png');

  /// File path: assets/images/ellipse_big_blue.png
  AssetGenImage get ellipseBigBlue =>
      const AssetGenImage('assets/images/ellipse_big_blue.png');

  /// File path: assets/images/ellipse_big_light.png
  AssetGenImage get ellipseBigLight =>
      const AssetGenImage('assets/images/ellipse_big_light.png');

  /// File path: assets/images/ellipse_big_red.png
  AssetGenImage get ellipseBigRed =>
      const AssetGenImage('assets/images/ellipse_big_red.png');

  /// File path: assets/images/ellipse_small_blue.png
  AssetGenImage get ellipseSmallBlue =>
      const AssetGenImage('assets/images/ellipse_small_blue.png');

  /// File path: assets/images/ellipse_small_light.png
  AssetGenImage get ellipseSmallLight =>
      const AssetGenImage('assets/images/ellipse_small_light.png');

  /// File path: assets/images/ellipse_small_red.png
  AssetGenImage get ellipseSmallRed =>
      const AssetGenImage('assets/images/ellipse_small_red.png');

  /// File path: assets/images/light_area.png
  AssetGenImage get lightArea =>
      const AssetGenImage('assets/images/light_area.png');

  /// File path: assets/images/light_area2.png
  AssetGenImage get lightArea2 =>
      const AssetGenImage('assets/images/light_area2.png');

  /// File path: assets/images/red_ball_dark.png
  AssetGenImage get redBallDark =>
      const AssetGenImage('assets/images/red_ball_dark.png');

  /// File path: assets/images/red_ball_light.png
  AssetGenImage get redBallLight =>
      const AssetGenImage('assets/images/red_ball_light.png');

  /// File path: assets/images/small_star.png
  AssetGenImage get smallStar =>
      const AssetGenImage('assets/images/small_star.png');

  /// File path: assets/images/star.png
  AssetGenImage get star => const AssetGenImage('assets/images/star.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        ballDark,
        ballLight2,
        darkArea,
        ellipseBigBlue,
        ellipseBigLight,
        ellipseBigRed,
        ellipseSmallBlue,
        ellipseSmallLight,
        ellipseSmallRed,
        lightArea,
        lightArea2,
        redBallDark,
        redBallLight,
        smallStar,
        star
      ];
}

class $AssetsSoundGen {
  const $AssetsSoundGen();

  /// File path: assets/sound/note1.wav
  String get note1 => 'assets/sound/note1.wav';

  /// List of all assets
  List<String> get values => [note1];
}

class Assets {
  Assets._();

  static const $AssetsColorsGen colors = $AssetsColorsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSoundGen sound = $AssetsSoundGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
