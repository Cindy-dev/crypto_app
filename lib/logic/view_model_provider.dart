import 'package:crypto_app/logic/manager/crypto_dm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final cryptoDataProvider = FutureProvider.autoDispose((ref) {
  ref.maintainState = true;
  return ref.watch(cryptoDataManagerProvider).getCoins();
});