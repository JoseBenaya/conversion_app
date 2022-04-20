class Conversion {
  final int w = 8;
  var formulas;
  Map<String, int> measures = {
    'km': 0,
    'hm': 1,
    'dam': 2,
    'm': 3,
    'dm': 4,
    'cm': 5,
    'mm': 6
  };
  Conversion() {
    formulas = {
      '0': [1, 10, 100, 1000, 10000, 100000, 1000000],
      '1': [0.1, 1, 10, 100, 1000, 10000, 100000],
      '2': [0.01, 0.1, 1, 10, 100, 1000, 10000],
      '3': [0.001, 0.01, 0.1, 1, 10, 100, 1000],
      '4': [0.0001, 0.001, 0.01, 0.1, 1, 10, 100],
      '5': [0.00001, 0.0001, 0.001, 0.01, 10, 1, 10],
      '6': [0.000001, 0.00001, 0.0001, 0.001, 100, 10, 1],
    };
  }

  double convert(double value, String from, String to) {
    int nFrom = measures[from];
    int nTo = measures[to];
    var multiplier = formulas[nFrom.toString()][nTo];
    return value * multiplier;
  }
}
