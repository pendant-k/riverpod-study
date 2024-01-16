# Official Doc Study
공식 문서 정리 내용

# Performing side effects
단순한 GET HTTP request의 경우는 사용하기가 쉽고 복잡하지 않다. 하지만 POST request와 같은 side-effects는 어떻게 해야할까?

어플리케이션에서는 CRUD를 모두 구현하는 경우가 많으며, 업데이트가 발생하는 경우 local cache 또한 업데이트하여 UI에 새로운 state를 반영해야한다.

consumer에서 사용하는 provider의 state는 어떻게 업데이트해야할까? Riverpod에서는 provider가 따로 state를 수정하는 방법을 제공하지 않는다.

이러한 처리를 위해서는 단순한 Provider를 사용하지 않고 Notifier를 활용해야한다.

Notifier는 provider의 stateful widget이라고 할 수 있다. Notifier를 작성하는 코드는 다음과 같다.
```dart
// global class which will create notifier provider automatically
// using code generation
@riverpod
class MyNotifier extends _$MyNotifier {
    @override
    Result build(){
        // your logic here
    }

    // your method (change states) here
}
```
- 모든 Notifier는 반드시 `build()`매서드를 오버라이드해야한다. non-Notifier에서 사용하던 provider 생성 관련 로직을 해당 매서드 내에 작성한다.

POST 요청 이후 state는 어떻게 업데이트를 해야할까? 이를 위해서 다양한 방법이 존재한다.


#### Updating our local cache to match the API response

만약 서버 로직에서 리턴 값으로 수정된 데이터를 보내준다면 이를 받아서 기존에 있던 provider state에 저장하면 된다.


```dart

Future<void> addTodo(Todo todo) async {
    final response = await http.post(
        Uri.https('your_api.com','/todos'),
        headers : {'Content-Type': 'application/json'},
        body: jsonEncode(todo.toJson()),
    )

    List<Todo> newTodos = (jsonDecode(response.body) as List)
        .cast<Map<String,Object?>>()
        .map(Todo.fromJson)
        .toList();

    state = AsyncData(newTodos);
}

```

해당 방식은 추가적인 GET 요청없이도 provider의 state를 업데이트하여 UI에 반영할 수 있다는 장점이 있으나 서버에서 자체적으로 리턴 값이 존재하는 경우에만 활용할 수 있고, 또한 GET request가 복잡한 경우(filtering/sorting)에는 적합하지 않을 수 있다.


#### Using `ref.invalidateSelf()` to refresh the provider

또 다른 방법 중 하나는 `ref.invalidateSelf()`매서드를 활용하는 것이다.

```dart
Future<void> addTodo(Todo todo) async {
  // We don't care about the API response
  await http.post(
    Uri.https('your_api.com', '/todos'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(todo.toJson()),
  );

  // Once the post request is done, we can mark the local cache as dirty.
  // This will cause "build" on our notifier to asynchronously be called again,
  // and will notify listeners when doing so.
  ref.invalidateSelf();

  // (Optional) We can then wait for the new state to be computed.
  // This ensures "addTodo" does not complete until the new state is available.
  await future;
}
```

이전의 방식과 동일하게 POST 요청을 보낸 뒤 리턴 값을 따로 받아오지 않고 기존에 존재하던 `List<Todo>`를 담고 있는 provider를 업데이트해주는 방식이다.

해당 방식은 most up-to-date state를 유지할 수 있게 해준다. (해당 시점에 다른 유저가 todo를 추가하는 것도 반영이 가능함.)

그러나 이러한 방식은 추가적인 GET request가 필요하다는 단점이 존재하며 이는 최적화 관련 이슈를 발생시킬 수 있다.


#### Updating the local cache manually

마지막으로 local cache를 수동으로 업데이트해주는 방법이 있다. 해당 방식은 백엔드의 동작을 모방하려는 시도가 존재할 수 있다.(백엔드에서 처리하는 로직을 동일하게 프론트 단에서도 하는 것)

```dart
Future<void> addTodo(Todo todo) async {
  // We don't care about the API response
  await http.post(
    Uri.https('your_api.com', '/todos'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(todo.toJson()),
  );

  // We can then manually update the local cache. For this, we'll need to
  // obtain the previous state.
  // Caution: The previous state may still be loading or in error state.
  // A graceful way of handling this would be to read `this.future` instead
  // of `this.state`, which would enable awaiting the loading state, and
  // throw an error if the state is in error state.
  final previousState = await future;

  // We can then update the state, by creating a new state object.
  // This will notify all listeners.
  state = AsyncData([...previousState, todo]);
}
```

이전의 state 값을 따로 변수에 저장해주고, 이를 포함하여 새로운 todo를 뒤에 추가한 `List<Todo>`값을 state에 할당하여 UI를 업데이트한다. 예제에서는 immutable state를 사용했으나, 이는 필수 사항이 아닌 권장사항이다.

immutability에 대한 상세 내용은 다음의 문서를 참고한다.
[Riverpod - Why Immutability](https://riverpod.dev/docs/concepts/why_immutability)

해당 방식은 단 하나의 요청만 사용한다는 장점이 존재하지만 실제 서버의 데이터와 일치하지 않을 수 있다는 단점이 존재한다. 만약 동일한 시점에 다른 사용자가 데이터를 업데이트한다면(예제에서는 Todo) 이는 local cache에 반영되지 못한다.

또한 실제 백엔드의 로직을 모방하여 작성하려면 더욱 복잡해질 수 있다.
