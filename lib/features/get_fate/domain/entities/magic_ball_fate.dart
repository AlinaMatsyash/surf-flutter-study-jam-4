import 'package:equatable/equatable.dart';

class MagicBallFate extends Equatable {
  final String text;

  const MagicBallFate({
    required this.text,
  });

  @override
  List<Object> get props => [text];
}
