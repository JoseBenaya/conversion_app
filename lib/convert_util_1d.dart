class Conversion {
  final int w = 8;
  Map<String, int> measures = {
    'km': 0,
    'hm': 1,
    'dm': 2,
    'm': 3,
    'dm': 4,
    'cm': 5,
    'mm': 6
  };
  List<double> formulas;
  Conversion() {
    formulas = List<double>();
    //row 1
    formulas.insert(0 + 0 * w, 1);
    formulas.insert(1 + 0 * w, 10);
    formulas.insert(2 + 0 * w, 100);
    formulas.insert(3 + 0 * w, 1000);
    formulas.insert(4 + 0 * w, 10000);
    formulas.insert(5 + 0 * w, 100000);
    formulas.insert(6 + 0 * w, 1000000);
    //row 2
    formulas.insert(0 + 1 * w, 0.1);
    formulas.insert(1 + 1 * w, 1);
    formulas.insert(2 + 1 * w, 10);
    formulas.insert(3 + 1 * w, 100);
    formulas.insert(4 + 1 * w, 1000);
    formulas.insert(5 + 1 * w, 10000);
    formulas.insert(6 + 1 * w, 100000);
    //row 3
    formulas.insert(0 + 2 * w, 0.01);
    formulas.insert(1 + 2 * w, 0.1);
    formulas.insert(2 + 2 * w, 1);
    formulas.insert(3 + 2 * w, 10);
    formulas.insert(4 + 2 * w, 100);
    formulas.insert(5 + 2 * w, 1000);
    formulas.insert(6 + 2 * w, 10000);
    //row 4
    formulas.insert(0 + 3 * w, 0.001);
    formulas.insert(1 + 3 * w, 0.01);
    formulas.insert(2 + 3 * w, 0.1);
    formulas.insert(3 + 3 * w, 1);
    formulas.insert(4 + 3 * w, 10);
    formulas.insert(5 + 3 * w, 100);
    formulas.insert(6 + 3 * w, 1000);
    //row 5
    formulas.insert(0 + 4 * w, 0.0001);
    formulas.insert(1 + 4 * w, 0.001);
    formulas.insert(2 + 4 * w, 0.01);
    formulas.insert(3 + 4 * w, 0.1);
    formulas.insert(4 + 4 * w, 1);
    formulas.insert(5 + 4 * w, 10);
    formulas.insert(6 + 4 * w, 100);
    //row 6
    formulas.insert(0 + 5 * w, 0.00001);
    formulas.insert(1 + 5 * w, 0.0001);
    formulas.insert(2 + 5 * w, 0.001);
    formulas.insert(3 + 5 * w, 0.01);
    formulas.insert(4 + 5 * w, 0.1);
    formulas.insert(5 + 5 * w, 1);
    formulas.insert(6 + 5 * w, 10);
    //row 7
    formulas.insert(0 + 6 * w, 0.000001);
    formulas.insert(1 + 6 * w, 0.00001);
    formulas.insert(2 + 6 * w, 0.0001);
    formulas.insert(3 + 6 * w, 0.001);
    formulas.insert(4 + 6 * w, 0.01);
    formulas.insert(5 + 6 * w, 0.1);
    formulas.insert(6 + 6 * w, 1);
  }

  double convert(double value, String from, String to) {
    int nFrom = measures[from];
    int nTo = measures[to];
    double multiplier = formulas[nTo + w * nFrom];
    return value * multiplier;
  }
}
