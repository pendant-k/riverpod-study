# AsyncValue
- 복잡한 요구사항들을 처리하기 위해서 상세하게 알아둘 필요가 있음
- 패키지 자체적으로 다양한 시나리오에도 쉽게 대비할 수 있도록 다양한 프로퍼티와 매서드를 제공해줌 (previousValue 같은 것들)

## important properties
- value
- error, stackTrace
- isLoading
- hasValue
- hasError (AsyncValueX)
- isReloading
- isRefreshing

## important methods
사용 예제는 AsyncValue 예제 참조

- `when()`
- `maybeWhen()`
- `whenOrNull()`
- `map()`
- `copyWithPrevious()`
