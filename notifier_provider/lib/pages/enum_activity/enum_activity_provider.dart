import 'package:notifier_provider/models/activity.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_state.dart';
import 'package:notifier_provider/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enum_activity_provider.g.dart';

@riverpod
class EnumActivity extends _$EnumActivity {
  var _errorCounter = 0;
  @override
  EnumActivityState build() {
    ref.onDispose(() {
      print('[EnumActivity] disposed');
    });
    return EnumActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    state = state.copyWith(status: ActivityStatus.loading);
    try {
      print(_errorCounter);
      if (_errorCounter++ % 2 != 1) {
        await Future.delayed(const Duration(seconds: 2));
        throw 'Fail to fetch activity';
      }
      // fetch data from api
      final response = await ref.read(dioProvider).get(
            '?type=$activityType',
          );
      // convert data to model
      // throw 'Fail to fetch activity';
      final activity = Activity.fromJson(response.data);

      state = state.copyWith(
        status: ActivityStatus.success,
        activity: activity,
      );
    } catch (e) {
      // print(e);
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}
