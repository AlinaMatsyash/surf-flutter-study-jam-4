import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

import '../../domain/entities/magic_ball_fate.dart';
import '../../domain/repositories/magic_ball_fate_repository.dart';
import '../datasources/magic_ball_fate.dart';

class MagicBallFateRepositoryImpl implements MagicBallFateRepository {
  final MagicBallFateDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MagicBallFateRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MagicBallFate>> getMagicBallFate() async {
    if (await networkInfo.isConnected) {
      try {
        final fate = await remoteDataSource.getMagicBallFate();
        return Right(fate);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
