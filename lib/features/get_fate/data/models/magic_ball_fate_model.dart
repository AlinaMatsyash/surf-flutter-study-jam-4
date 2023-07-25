import '../../domain/entities/magic_ball_fate.dart';

class MagicBallFateModel extends MagicBallFate {
  MagicBallFateModel({
    required String text,
  }) : super(text: text);

  factory MagicBallFateModel.fromJson(Map<String, dynamic> json) {
    return MagicBallFateModel(
      text: json['reading'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reading': text,
    };
  }
}
