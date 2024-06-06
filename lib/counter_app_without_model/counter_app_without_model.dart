import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifierProvider, StreamProvider, FutureProvider,
//StateProvider, ChangeNotifireProvider

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterAppWithOutModel extends ConsumerWidget {
  const CounterAppWithOutModel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    ref.listen(counterProvider, ((previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("This value is $next")));
      }
    }));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("State Provider"),
          actions: [
            IconButton(
                onPressed: () {
                  ref.invalidate(counterProvider);
                  // OR
                  // ref.refresh(counterProvider);
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: Center(
            child: Text(count.toString(), style: TextStyle(fontSize: 25))),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              // ref.read(counterProvider.notifier).state++;
              // OR
              ref.read(counterProvider.notifier).update((state) => state - 1);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              // ref.read(counterProvider.notifier).state++;
              // OR
              ref.read(counterProvider.notifier).update((state) => state + 1);
            },
            child: Icon(Icons.add),
          ),
        ]));
  }
}
