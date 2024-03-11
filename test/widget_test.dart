import 'dart:async';

import 'package:rxdart/rxdart.dart';

void main() async {
  final stream = RangeStream(0, 10)
      .buffer(Stream.periodic(Duration(milliseconds: 160), (i) => i))
      .debounce((i) => TimerStream(i, Duration(seconds: 1)));
  await for (var val in stream) {
    print(val);
  }
}
