# provider 정리 노트

## Provider 패키지와의 비교점
- Provider 패키지에서는 provider가 Widget으로 정의되었기 때문에 Flutter에서만 사용이 가능했다.
- Riverpod 패키지에서는 provider가 Dart object이기 때문에 Flutter외에 Dart App에서도 사용이 가능하다.

- Provider 패키지에서는 동일한 타입의 Provider를 사용하는 데에 제약이 존재했다.
(Type이 같은 provider의 경우 위젯트리 상 가까운 provider만 참조할 수 있었음)

- build callback에서는 절대 `read()`를 사용하지 말아야한다.

consumer widget을 사용하는 경우 Consumer보다 편리하지만, rebuild 범위가 커질 수 있음을 주의

- family provider는 argument를 하나만 받을 수 있다는 단점이 있다.

## Provider
- 주로 computed state에 사용한다(다른 형태의 provider와 결합하여 사용하는 편임)