import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'counter_provider.g.dart';

// build 내에서 ref를 사용할 수 있다.
// StateNotifier, ChangeNotifier는 ref를 받아와야했다.
// constructor tear-offs
// class Counter extends Notifier<int> {
//   // 외부에서 접근 가능한 변수를 선언해서는 안됨
//   // int publicVar = 0;
//   @override
//   int build() {
//     return 0;
//   }

//   void increment() {
//     state++;
//   }
// }

// 상황에 맞게 여러가지 조합으로 사용할 수 있음.
// FamilyNotifier
// AutoDisposeFamilyNotifier
// AutoDisposeNotifier

// final counterProvider = NotifierProvider<Counter, int>(() {
//   return Counter();
// });
// Apply tear-offs
// final counterProvider = NotifierProvider<Counter, int>(Counter.new);

@riverpod
class Counter extends _$Counter {
  @override
  int build(int initialValue) {
    return initialValue;
  }

  void increment() {
    state++;
  }
}
