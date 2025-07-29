import 'package:flutter/material.dart';
import 'package:ola_mundo/app/models/currency_model.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 0.0;
    double returnValue = 0.0;
    if (toText.text.isEmpty) {
      fromText.text = 'ERRO, digite um valor!';
      return;
    }

    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dólar') {
      returnValue = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      returnValue = value * toCurrency.bitcoin;
    } else if (fromCurrency.name == 'Libra') {
      returnValue = value * toCurrency.libra;
    } else if (fromCurrency.name == 'Iene') {
      returnValue = value * toCurrency.iene;
    } else if (fromCurrency.name == 'Peso Argentino') {
      returnValue = value * toCurrency.peso;
    }
    fromText.text = returnValue < 0.01 ? returnValue.toStringAsFixed(8) : returnValue.toStringAsFixed(2);
  }
}
