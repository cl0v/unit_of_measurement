import 'package:unit_of_measurement/unit_of_measurement.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Multiply same kind Units', () {
      final expected = Meter(10) * Meter(1);

      expect(expected.toString(), "10m2");
      expect(expected.toString(), Meter(10, 2).toString());
    });
    test('Multiply different kind Units', () {
      final expected = Meter(10) * Second(1);

      expect(expected.toString(), "10m.s");
      expect(expected.toString(), Unit(10, {Kind('m'), Kind('s')}).toString());
    });
    test('Multiply different kind Units', () {
      final expected = Meter(10) * Second(1) * Meter(10);

      expect(expected.toString(), "100m2.s");
      expect(
          expected.toString(), Unit(100, {Kind('m', 2), Kind('s')}).toString());
    });
  });
}
