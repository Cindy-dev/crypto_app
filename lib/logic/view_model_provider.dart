import 'package:crypto_app/data/model/crypto_model.dart';
import 'package:crypto_app/logic/manager/crypto_dm.dart';
import 'package:crypto_app/logic/view_model/coin_data_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controllers/request_view_model.dart';

final cryptoDataProvider = FutureProvider.autoDispose((ref) {
  ref.maintainState = true;
  return ref.watch(cryptoDataManagerProvider).getCoins();
});