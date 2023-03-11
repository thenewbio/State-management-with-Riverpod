// stream provider
// streams are reactive pipe for data
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const names = [
  'Okama',
  'Innocent',
  'Okwuchukwu',
  'Barnabas',
  'Manager',
  'Oky',
  'Okwy',
  'Inositol',
  'Nigeria'
];

final tickerProvider = StreamProvider((ref) => Stream.periodic(
      const Duration(seconds: 1),
      (i) => i + 1,
    ));
final nameProvider = StreamProvider(
  (ref) => ref.watch(tickerProvider.stream).map(
        (count) => names.getRange(
          0,
          count,
        ),
      ),
);

class Example4 extends ConsumerWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
        centerTitle: true,
      ),
      body: names.when(
          data: (names) {
            return ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      names.elementAt(index),
                    ),
                  );
                });
          },
          error: (error, stackTrace) =>
              const Text('Reached the end of the list'),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
