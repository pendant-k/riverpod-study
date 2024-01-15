# Riverpod Study Repository
해당 Repository는 개인적인 목적으로 Riverpod을 활용한 state management를 학습, 정리하기 위한 용도로 사용했습니다.

--- 
## NotifierProvider
[Notifier Provider Doc](https://github.com/pendant-k/riverpod-study/blob/main/docs/notifierProvider.md)

**State Shape case study**
State Shape에 대한 추가적인 스터디 및 고민이 필요함

(`initial`, `loading`, `success`, `failure`)


- [x] enum based
- [ ] sealed class based
- [ ] AsyncValue based (Riverpod)

## 여러 provider를 합쳐서 사용하기
- Post Detail 페이지에서 User 데이터와 Post 데이터가 둘 다 필요한 경우 어떻게 합칠 수 있나?
- `read()` 매서드로 user 데이터를 읽어와도 괜찮지 않나? 
- 다른 Notifier의 정보를 읽어와서 Notifier에서 사용하는 게 바람직한가?