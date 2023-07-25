import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/magic_ball_fate.dart';

abstract class MagicBallFateRepository {
  Future<Either<Failure, MagicBallFate>> getMagicBallFate();
}
