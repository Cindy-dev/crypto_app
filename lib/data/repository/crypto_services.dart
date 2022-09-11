import 'package:crypto_app/data/model/crypto_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

class CoinApiService {
  Dio dio = Dio();
  Logger logger = Logger();

  Future<List<CryptoModel>> getCoins() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd';
    try {
      final response = await dio.get(url);
      logger.wtf(response.data);
      final cryptoModel = cryptoModelFromJson(response.data);
      return cryptoModel;
    } catch (e) {
      logger.wtf(e);
      throw e;
    }
  }
}

final coinApiServiceProvider = Provider<CoinApiService>((ref) => CoinApiService());
