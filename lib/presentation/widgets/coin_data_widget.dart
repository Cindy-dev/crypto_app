import 'package:crypto_app/logic/view_model_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CoinDataWidget extends StatefulHookConsumerWidget {
  const CoinDataWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CoinDataWidget> createState() => _CoinDataWidgetState();
}

class _CoinDataWidgetState extends ConsumerState<CoinDataWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(cryptoDataProvider);
    return Container(
        child: viewModel.when(
            idle: () => Container(),
            loading: () => const CircularProgressIndicator(
                  color: Colors.white,
                ),
            success: (data) {
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return Text(data![index].name!);
                  });
            },
            error: (e, s) => Text(e.toString())));
  }
}
