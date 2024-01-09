import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyHelloProvider = Provider.family<String, String>((ref, name) {
  // call when provider is disposed
  ref.onDispose(() {
    print("[familyHelloProvider] disposed");
  });
  return 'Hello $name';
});

final familyNumProvider = Provider.family<String, int>((ref, value) {
  // call when provider is disposed
  ref.onDispose(() {
    print("[familyNumProvider] disposed");
  });
  return value.toString();
});
