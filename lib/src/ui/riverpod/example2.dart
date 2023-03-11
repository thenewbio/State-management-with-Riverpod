import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void testIt() {
  final int? int1 = 1;
  final int? int2 = null;

  final result = int1 + int2;
  print(result);
}

// as long as the left hand value is not null, result should not  be null
extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

class Counter extends StateNotifier<int?> {
  Counter() : super(null);

  void increment() => state = state == null ? 1 : state + 1;
  // int? get value => state;
}

final counterProvider =
    StateNotifierProvider<Counter, int?>((ref) => Counter());

class Example2 extends ConsumerWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // testIt();

    // a waste of provider
    // final  counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final count = ref.watch(counterProvider);
            final text = count == null ? " Press the button" : count.toString();
            // print(text);
            return Text(text);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
              onPressed: ref.read(counterProvider.notifier).increment,
              child: Text("Increment counter"))
        ],
      ),
    );
  }
}
