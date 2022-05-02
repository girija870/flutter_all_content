import 'package:flut_all_content/counter.dart';
import 'package:test/test.dart';

main() {
  group('Counter', () {
    test('Value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('Counter Value should incremented', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('Counter Value should decremented', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
