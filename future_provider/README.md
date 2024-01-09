## FutureProvider

- 단순한 곳에 사용하는 provider이며, 유저 인터렉션이 존재하는 경우에는 AsyncNotifierProvider 사용을 권장한다.
- `refresh`, `re-fetching` 등을 위해서 watch하는 provider를 강제 dispose하는 방법이 있다.
<br>

`refresh()` method, `invalidate` : provider를 강제 dispose시킬 수 있다.

아래의 두 코드는 동일한 동작을 수행한다.
```dart
    final newValue = ref.refresh(provider);

```

```dart
    ref.invalidate(provider);
    final newValue = ref.read(provider);
```
만약 refresh하여 받아온 새로운 값은 상관없는 상황이라면 `invalidate()`를 사용하도록 하자.

- `invalidate()`로 데이터를 다시 가져오면, `AsyncLoading<T>`가 아니라 `AsyncData<T>`에 `isLoading` prop이 담긴 obj가 리턴된다.

