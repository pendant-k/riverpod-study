import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/pages/auto_dispose_family/auto_dispose_family_provider.dart';
// import 'package:provider/pages/auto_dispose_family/auto_dispose_family_provider.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(autoDisposeFamilyProvider(there: 'john'));
    ref.watch(autoDisposeFamilyProvider(there: 'jane'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDisposeFamilyProvider'),
      ),
      body: const Center(
        child: Text('AutoDisposeFamilyProvider'),
      ),
    );
  }
}
