import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_demo.dart';

final counterProvider = StateNotifierProvider<CounterDemo, int>((ref) {
  return CounterDemo();
});

class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Riverpod Counter App"),
          actions: [
            IconButton(
                onPressed: () {
                  ref.invalidate(counterProvider);
                  // OR
                  // ref.refresh(counterProvider);
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: Center(
            child:
                Text(count.toString(), style: const TextStyle(fontSize: 25))),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                // ref.read(counterProvider.notifier).state++;
                // OR
                ref.read(counterProvider.notifier).decrement();
              },
              child: const Text(
                "-",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                // ref.read(counterProvider.notifier).state++;
                // OR
                ref.read(counterProvider.notifier).increment();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
