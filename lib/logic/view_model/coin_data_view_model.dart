import 'package:crypto_app/data/model/crypto_model.dart';
import 'package:crypto_app/logic/controllers/request_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../manager/crypto_dm.dart';

class CryptoDataViewModel extends RequestStateNotifier<List<CryptoModel>> {
  final CryptoDataManager cryptoDataManager;

  CryptoDataViewModel(Ref ref)
      : cryptoDataManager = ref.read(cryptoDataManagerProvider) {}

  void getCoins() => makeRequest(() => cryptoDataManager.getCoins());
}
