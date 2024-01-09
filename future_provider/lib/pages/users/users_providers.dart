import 'package:future_provider/models/user.dart';
import 'package:future_provider/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_providers.g.dart';

// Future Provider for user List (fetching data from API)
// This provider should be autoDispose Provider because it used with generated provider (dioProvider)
// final userListProvider = FutureProvider.autoDispose<List<User>>((ref) async {
//   final dio = ref.read(dioProvider);
//   // dio provider를 사용해서 인스턴스 생성을 최소화하는 것 같다.
//   final response = await dio.get('/users');
//   final data = response.data;
//   final users = [for (final user in data as List) User.fromJson(user)];
//   return users;
// });

// code gen version

@riverpod
FutureOr<List<User>> userList(UserListRef ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/users');
  final data = response.data;
  final users = [for (final user in data as List) User.fromJson(user)];
  return users;
}

@riverpod
FutureOr<User> userDetail(UserDetailRef ref, int id) async {
  ref.onDispose(() {
    print('UserDetailRef disposed');
  });
  final response = await ref.watch(dioProvider).get('/users/$id');
  // listeners가 모두 제거되어도 state가 유지된다.
  // 통신이 끝난 후에 사용해야함.
  ref.keepAlive();
  final user = User.fromJson(response.data);
  return user;
}

@Riverpod(keepAlive: false)
FutureOr<int> returnOne(ReturnOneRef ref) {
  ref.keepAlive();
  return Future.value(1);
}
