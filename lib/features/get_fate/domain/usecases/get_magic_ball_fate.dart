import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/magic_ball_fate.dart';
import '../repositories/magic_ball_fate_repository.dart';

class GetMagicBallFate implements UseCase<MagicBallFate, NoParams> {
  final MagicBallFateRepository repository;

  GetMagicBallFate(this.repository);

  @override
  Future<Either<Failure, MagicBallFate>> call(NoParams params) async {
    return await repository.getMagicBallFate();
  }
}
