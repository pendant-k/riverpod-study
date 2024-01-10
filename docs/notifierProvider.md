# NotifierProvider
Riverpod에서는 복잡한 Business logic이 포함된 state의 경우 Notifier를 사용하는 것을 권장하고 있다.

- Notifier에서 관리되는 State는 외부에서 수정이 불가능한 immutable object이며, interface를 통해서만 외부에서 수정이 가능하다.
