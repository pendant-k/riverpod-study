// weather first를 두가지로 분리한 버전
import 'package:asyncvalue_details/models/cities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_second_provider.g.dart';

@riverpod
class City extends _$City {
  @override
  Cities build() {
    print('[city Provider] initialized');
    ref.onDispose(() {
      print('[city Provider] disposed');
    });
    return Cities.seoul;
  }

  void changeCity(Cities city) {
    state = city;
  }
}

@riverpod
FutureOr<String> weatherSecond(WeatherSecondRef ref) async {
  print('[weatherSecond Provider] initialized');
  ref.onDispose(() {
    print('[weatherSecond Provider] disposed');
  });

  // watch method - when city changes, this provider will be re-evaluated
  final city = ref.watch(cityProvider);
  // delay 1 second
  await Future.delayed(const Duration(seconds: 1));

  switch (city) {
    case Cities.seoul:
      return '${city.name} - 23';
    case Cities.london:
      throw 'Fail to fetch the temperature of ${city.name}';
    case Cities.bangkok:
      throw 'Fail to fetch the temperature of ${city.name}';
    case Cities.tokyo:
      return '${city.name} - 28';
  }
}
