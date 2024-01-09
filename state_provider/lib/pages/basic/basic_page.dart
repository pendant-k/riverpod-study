import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider/pages/basic/basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = ref.watch(counterProvider);
    ref.listen(counterProvider, (previous, next) {
      print('previous : $previous, next : $next');
      if (next == 3) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('counter : $next'),
          ),
        );
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('StateProvider'),
        ),
        body: Center(
          child: Text(
            '$c',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // notifier -> StateController
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: const Icon(Icons.add),
        ));
  }
}
