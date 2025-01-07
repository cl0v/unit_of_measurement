// ignore_for_file: public_member_api_docs, sort_constructors_first
class Unit {
  final double magnitude;
  final List<Kind> kind;

  Unit(
    this.magnitude,
    this.kind,
  ) : assert(kind.length <= 3);

  @override
  toString() => '$magnitude $kind';

  operator *(dynamic other) {
    if (other is double || other is int) {
      return Unit(magnitude * other, kind);
    }
    if (other is Unit) {
      return Unit(
        magnitude * other.magnitude,
        kind + other.kind,
      );
    }
  }
}

class Meter extends Unit {
  Meter(
    double magnitude, [
    int dimension = 1,
  ]) : super(
          magnitude,
          [
            Kind('m', dimension),
          ],
        );
}

class Second extends Unit {
  Second(
    double magnitude, [
    int dimension = 1,
  ]) : super(
          magnitude,
          [
            Kind('s', dimension),
          ],
        );
}

class Gram extends Unit {
  Gram(
    double magnitude, [
    int dimension = 1,
  ]) : super(
          magnitude,
          [
            Kind('g', dimension),
          ],
        );
}

class Kind {
  final String symbol;
  final int dimension;

  Kind(
    this.symbol,
    this.dimension,
  );

  // operator +(Kind other) {
  //   if (symbol != other.symbol) {
  //     throw ArgumentError('Symbols must be the same');
  //   }
  //   return Kind(
  //     symbol,
  //     dimension + other.dimension,
  //   );
  // }

  // List<Kind> operator -(List<Kind> other) {
  //   if (symbol != other.symbol) {
  //     throw ArgumentError('Symbols must be the same');
  //   }
  //   return [
  //     Kind(
  //       symbol,
  //       dimension - other.dimension,
  //     )
  //   ];
  // }

  // List<Kind> operator +(List<Kind> other) {
  //   String symbol = this.symbol;
  //   if (other.symbol != symbol) {
  //     return Kind(
  //       "($symbol . ${other.symbol})",
  //       dimension * other.dimension,
  //     );
  //   }
  //   return Kind(
  //     symbol,
  //     dimension * other.dimension,
  //   );
  // }

  @override
  toString() => '$symbol$dimension';
}

/// Usage example:
void main() {
  
}
