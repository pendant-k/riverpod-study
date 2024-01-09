// Provider 생성하기
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

// final helloProvider = Provider<String>((ref) {
//   // call when provider is disposed
//   ref.onDispose(() {
//     print("[helloProvider] disposed");
//   });
//   return 'Hello';
// });

// final worldProvider = Provider<String>((ref) {
//   // call when provider is disposed
//   ref.onDispose(() {
//     print("[worldProvider] disposed");
//   });
//   return 'World';
// });

// autoDispose를 안한다면 사용하지 않는다고 해도 자동으로 메모리에서 해제되지 않는다.
// 하지만 임의로 dispose를 호출할수도 있기 때문에 기본 provider에서도 onDispose는 필요하다.

// riverpod generator에게 알려주기용
@Riverpod(keepAlive: true)
String hello(HelloRef ref) {
  // call when provider is disposed
  ref.onDispose(() {
    print("[helloProvider] disposed");
  });
  return 'Hello';
}
