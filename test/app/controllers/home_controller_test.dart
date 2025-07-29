import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:ola_mundo/app/controllers/home_controller.dart';
import 'package:ola_mundo/app/models/currency_model.dart';

void main() {
  late TextEditingController toText;
  late TextEditingController fromText;
  late HomeController homeController;

  setUp(() {
    toText = TextEditingController();
    fromText = TextEditingController();
    homeController = HomeController(toText: toText, fromText: fromText);
  });

  String formatConvertedValue(double value) {
    if (value >= 0.01) {
      return value.toStringAsFixed(2);
    } else if (value >= 0.000001) {
      return value.toStringAsFixed(6);
    } else {
      return value.toStringAsExponential(2);
    }
  }

  test('deve converter de real para dolar', () {
    toText.text = '2.0';
    homeController.toCurrency = CurrencyModel(
      name: 'Dólar',
      real: 5.65,
      dolar: 1.0,
      euro: 0.85,
      bitcoin: 0.000088,
      libra: 0.72,
      iene: 159.03,
      peso: 857.46,
    );
    homeController.fromCurrency = CurrencyModel(
      name: 'Real',
      real: 1.0,
      dolar: 0.18,
      euro: 0.15,
      bitcoin: 0.000016,
      libra: 0.13,
      iene: 28.80,
      peso: 155.42,
    );
    homeController.convert();

    double value = double.tryParse(toText.text.replaceAll(',', '.')) ?? 1.0;
    double expectedValue = 0.0;

    if (homeController.fromCurrency.name == 'Real') {
      expectedValue = value * homeController.toCurrency.real;
    } else if (homeController.fromCurrency.name == 'Dólar') {
      expectedValue = value * homeController.toCurrency.dolar;
    } 

    expect(fromText.text, formatConvertedValue(expectedValue));
  });

  test('deve converter de dolar para real', () {
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(
      name: 'Real',
      real: 1.0,
      dolar: 0.18,
      euro: 0.15,
      bitcoin: 0.000016,
      libra: 0.13,
      iene: 28.80,
      peso: 155.42,
    );
    homeController.fromCurrency = CurrencyModel(
      name: 'Dólar',
      real: 5.65,
      dolar: 1.0,
      euro: 0.85,
      bitcoin: 0.000088,
      libra: 0.72,
      iene: 159.03,
      peso: 857.46,
    );
    homeController.convert();

    double value = double.tryParse(toText.text.replaceAll(',', '.')) ?? 1.0;
    double expectedValue = 0.0;

    if (homeController.fromCurrency.name == 'Real') {
      expectedValue = value * homeController.toCurrency.real;
    } else if (homeController.fromCurrency.name == 'Dólar') {
      expectedValue = value * homeController.toCurrency.dolar;
    }
    expect(fromText.text, formatConvertedValue(expectedValue));
  });
}
