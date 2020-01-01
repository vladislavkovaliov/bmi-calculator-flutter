import 'dart:math';

class Calculator {
  Calculator({
    this.weight,
    this.height,
  }) {
    this.calculateBMI();
  }

  final int weight;
  final int height;

  double _bmi;

  double calculateBMI() {
    this._bmi = this.weight / pow(this.height / 100, 2);

    return this._bmi;
  }

  String getResult() {
    if (this._bmi >= 25) {
      return 'Overweight';
    }

    if (this._bmi > 18.5) {
      return 'Normal';
    }

    return 'Underweight';
  }

  String getBMI() {
    return this._bmi.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (this._bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    }

    if (this._bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    }

    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
