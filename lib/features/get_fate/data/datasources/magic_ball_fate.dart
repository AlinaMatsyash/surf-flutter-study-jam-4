import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../models/magic_ball_fate_model.dart';

abstract class MagicBallFateDataSource {
  Future<MagicBallFateModel> getMagicBallFate();
}

class MagicBallFateDataSourceImpl implements MagicBallFateDataSource {
  final Dio client;
  final Dio _dio = Dio();

  MagicBallFateDataSourceImpl({required this.client});

  @override
  Future<MagicBallFateModel> getMagicBallFate() =>
      _getTriviaFromUrl('https://eightballapi.com/api');

  Future<MagicBallFateModel> _getTriviaFromUrl(String url) async {
    Response userData = await _dio.get(url);

    if (userData.statusCode == 200) {
      return MagicBallFateModel.fromJson(userData.data);
    } else {
      throw ServerException();
    }
  }
}
