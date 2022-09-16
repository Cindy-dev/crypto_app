import 'package:crypto_app/data/model/crypto_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

import '../model/chart_model.dart';

class CoinApiService {
  Dio dio = Dio();
  Logger logger = Logger();

  Future getCoins() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd';
    try {
      final response = await dio.get(url);
      final cryptoModel = List<CryptoModel>.from(
          response.data.map((x) => CryptoModel.fromJson(x)));
      return cryptoModel;
    } catch (e) {
      logger.wtf(e);
      throw e;
    }
  }

  Future getCryptoChart(String id) async {
    final url =
        'https://api.coingecko.com/api/v3/coins/$id?localization=false&tickers=true&community_data=false&developer_data=false';
    try {
      final response = await dio.get(url);
      final chartModel = ChartModel.fromJson(response.data);
      return chartModel;
    } on DioError catch (e) {
      print(e);
      //logger.wtf(e);
      throw e;
    }
  }
}


final coinApiServiceProvider =
    Provider<CoinApiService>((ref) => CoinApiService());
