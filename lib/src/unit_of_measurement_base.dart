class Unit {
  final double magnitude;
  final Set<Kind> kind;

  Unit(
    this.magnitude,
    this.kind,
  ) : assert(kind.length <= 3);

  @override
  toString() {
    var k = "";
    final len = kind.length;
    for (var i = 0; i < len; i++) {
      k += kind.toList()[i].toString();
      if (kind.hasNext(i)) {
        k += ".";
      }
    }
    bool isPerfectDouble(double value) {
      return value == value.toInt();
    }

    if (isPerfectDouble(magnitude)) {
      return '${magnitude.toInt()}$k';
    }
    return '$magnitude$k';
  }

  operator *(dynamic other) {
    if (other is double || other is int) {
      return Unit(magnitude * other, kind);
    }
    if (other is Unit) {
      final m = magnitude * other.magnitude;
      Set<Kind> r = Set.from(kind)..addAll(Set.from(other.kind));
      final k = r.fold(<Kind>{}, (prev, element) {
        final ls = prev.toList().map<String>((p) => p.symbol);
        if (ls.contains(element.symbol)) {
          prev.firstWhere((s) => s.symbol == element.symbol).dimension +=
              element.dimension;
          return prev;
        } else {
          prev.add(element);
        }
        return prev;
      });
      print(k);

      return Unit(m, k);
    }
  }
}

class Meter extends Unit {
  Meter(
    double magnitude, [
    int dimension = 1,
  ]) : super(
          magnitude,
          {Kind('m', dimension)},
        );
}

class Second extends Unit {
  Second(
    double magnitude, [
    int dimension = 1,
  ]) : super(magnitude, {
          Kind('s', dimension),
        });
}

class Gram extends Unit {
  Gram(
    double magnitude, [
    int dimension = 1,
  ]) : super(
          magnitude,
          {Kind('g', dimension)},
        );
}

class Kind {
  final String symbol;
  int dimension;

  Kind(
    this.symbol, [
    this.dimension = 1,
  ]);

  operator +(Kind other) {
    if (symbol != other.symbol) {
      throw ArgumentError('Symbols must be the same');
    }
    return Kind(
      symbol,
      dimension + other.dimension,
    );
  }

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
  toString() {
    if (dimension == 1) return symbol;
    return '$symbol$dimension';
  }
}

extension SetX on Set {
  bool hasNext(int index) => index < length - 1;
}
