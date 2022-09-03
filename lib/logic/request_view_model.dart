import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_view_model.freezed.dart';


class RequestStateNotifier<T> extends StateNotifier<RequestState<T>> {
  RequestStateNotifier() : super(const RequestState.idle());

  Future<RequestState<T>> makeRequest(Future<T> Function() function) async {
    try {
      state = RequestState<T>.loading();
      final response = await function();
      final newState = RequestState<T>.success(response);
      if (mounted) {
        state = newState;
      }
      return newState;
    } catch (e, st) {
      final newState = RequestState<T>.error(e, st);
      if (mounted) {
        state = newState;
      }
      return newState;
    }
  }
}

@freezed
class RequestState<T> with _$RequestState<T> {
  const factory RequestState.idle() = Idle<T>;
  const factory RequestState.loading() = Loading<T>;
  const factory RequestState.success(T? value) = Success<T>;
  const factory RequestState.error(Object error, StackTrace stackTrace) =
      Error<T>;
}
//all crypto id
//https://pro-api.coinmarketcap.com/v1/cryptocurrency/map?CMC_PRO_API_KEY=0023c0a2-98e2-473e-8bce-a0b2f29fb8dc

//use this to get category of a coin by passing in an id
//https://pro-api.coinmarketcap.com/v1/cryptocurrency/category?CMC_PRO_API_KEY=0023c0a2-98e2-473e-8bce-a0b2f29fb8dc

//list of all categories
//https://pro-api.coinmarketcap.com/v1/cryptocurrency/categories?CMC_PRO_API_KEY=0023c0a2-98e2-473e-8bce-a0b2f29fb8dc

//



//0023c0a2-98e2-473e-8bce-a0b2f29fb8dc