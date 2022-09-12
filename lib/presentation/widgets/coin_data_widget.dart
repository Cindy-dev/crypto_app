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
    return Center(
      child: Builder(
        builder: (context) {
          final result = ref.watch(cryptoDataProvider);
          return result.when(
              loading: () => const CircularProgressIndicator(
                    color: Colors.white,
                  ),
              data: (data) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return
                        Row(
                          children: [
                            
                          ],
                        );
                        Text(
                        data![index].name!,
                        style: const TextStyle(color: Colors.white),
                      );
                    });
              },
              error: (e, s) => Text(e.toString()));
        },
      ),
    );
  }
}
