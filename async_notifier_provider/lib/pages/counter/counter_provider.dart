import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CounterNotifier extends AsyncNotifier<int> {
  // Future<T> or <T>
  @override
  FutureOr<int> build() async {
    ref.onDispose(() {
      print('dispose');
    });

    await waitSecond();
    return 0;
  }

  Future<void> waitSecond() => Future.delayed(const Duration(seconds: 1));
  Future<void> increment() async {
    state = const AsyncLoading();

    try {
      await waitSecond();
      state = AsyncData(state.value! + 1);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  Future<void> decrement() async {
    state = const AsyncLoading();

    try {
      await waitSecond();
      state = AsyncData(state.value! - 1);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}

final counterProvider = AsyncNotifierProvider<CounterNotifier, int>(CounterNotifier.new);
