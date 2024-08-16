enum DisplayMode {
  grid,
  list;

  DisplayMode toggle() {
    // 나중에 값이 추가되도 이 부분을 수정하지 않아도 되도록 enum을 열거한뒤 다음값을 반환한다.
    // 다음값이 없다면 최초 초기값을 반환한다.
    const list = DisplayMode.values;

    if (index + 1 < list.length) {
      return list[index + 1];
    } else {
      return list.first;
    }
  }

  const DisplayMode();
}