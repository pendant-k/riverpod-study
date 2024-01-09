import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeHelloProvider = Provider.autoDispose<String>((ref) {
  ref.onDispose(() {
    print('disposed');
  });
  return 'Hello';
});
