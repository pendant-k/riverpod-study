import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

final counterProvider = StateProvider<int>((ref) {
  ref.onDispose(() {
    print('[counterProvider] disposed');
  });
  return 0;
});

// StateProvider with keepAlive option
@Riverpod(keepAlive: true)
String age(AgeRef ref) {
  final value = ref.watch(counterProvider);
  ref.onDispose(() {
    print('[ageProvider] disposed');
  });
  return "I am $value years old.";
}

// It will be disposed when value from counterProvider is changed.