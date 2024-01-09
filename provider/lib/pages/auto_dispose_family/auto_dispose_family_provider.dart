import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auto_dispose_family_provider.g.dart';

// family provider에서 auto dispose를 사용하면, parameter가 바뀔 때마다 provider가 dispose되고 다시 생성된다.

class Counter {
  final int count;
  Counter({required this.count});

  @override
  String toString() => 'Counter(count: $count)';
}

final counterProvider = Provider.autoDispose.family<int, Counter>(
  (ref, c) {
    ref.onDispose(() {
      print('[counterProvider] onDispose: $c');
    });

    return c.count;
  },
);

@riverpod
String autoDisposeFamily(AutoDisposeFamilyRef ref, {required String there}) {
  ref.onDispose(() {
    print("[autoDisposeFamily] $there disposed");
  });
  return "hello $there";
}
