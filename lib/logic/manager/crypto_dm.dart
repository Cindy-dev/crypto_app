import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/crypto_model.dart';
import '../../data/repository/crypto_services.dart';
import '../implementation/crypto_dm_impl.dart';

class CryptoDataManager extends CryptoDataManagerImpl {
  final CoinApiService coinApiService;
  CryptoDataManager({required this.coinApiService});

  @override
  Future<List<CryptoModel>> getCoins() async => await coinApiService.getCoins();
}

final cryptoDataManagerProvider = Provider((ref) {
  final cryptoDataManager = ref.watch(coinApiServiceProvider);
  return CryptoDataManager(coinApiService: cryptoDataManager);
});
