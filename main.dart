// ignore_for_file: public_member_api_docs, sort_constructors_first
class Unit {
  final double magnitude;
  final Kind kind;

  Unit(
    this.magnitude,
    this.kind,
  );

  @override
  toString() => '$magnitude $kind';

  operator *(dynamic other) {
    if (other is double || other is int) {
      return Unit(magnitude * other, kind);
    }
    if (other is Unit) {
      return Unit(magnitude * other.magnitude, kind + other.kind);
    }
  }
}

class Kind {
  final String symbol;
  final int dimension;

  Kind(
    this.symbol,
    this.dimension,
  );

  operator +(Kind other) {
    if (symbol != other.symbol) {
      throw ArgumentError('Symbols must be the same');
    }
    return Kind(symbol, dimension + other.dimension);
  }

  @override
  toString() => '$symbol$dimension';
}

class Meter extends Kind {
  Meter(int dimension) : super('m', dimension);
}

class Second extends Kind {
  Second(int dimension) : super('s', dimension);
}

class Kilogram extends Kind {
  Kilogram(int dimension) : super('kg', dimension);
}


/// Usage example:
void main() {
  final meter = Unit(10, Meter(1));

  print(meter * Unit(1, Kind('m', 1)));
}
