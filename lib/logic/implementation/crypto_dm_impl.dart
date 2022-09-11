import '../../data/model/crypto_model.dart';

abstract class CryptoDataManagerImpl {
  Future<List<CryptoModel>> getCoins();
}