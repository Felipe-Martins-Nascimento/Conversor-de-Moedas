class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;
  final double libra;
  final double iene;
  final double peso;

  CurrencyModel({
    required this.name,
    required this.real,
    required this.dolar,
    required this.euro,
    required this.bitcoin,
    required this.libra,
    required this.iene,
    required this.peso,
  });

  static List<CurrencyModel> getCurrencies() {
    return [
      CurrencyModel(
        name: 'Real',
        real: 1.0,
        dolar: 0.181,           
        euro: 0.154,            
        bitcoin: 0.00000154,    
        libra: 0.13,           
        iene: 28.80,            
        peso: 155.42,           
      ),
      CurrencyModel(
        name: 'Dólar',
        real: 5.53,
        dolar: 1.0,
        euro: 0.85,
        bitcoin: 0.00000849,
        libra: 0.72,
        iene: 159.03,
        peso: 857.46,
      ),
      CurrencyModel(
        name: 'Euro',
        real: 6.50,
        dolar: 1.18,
        euro: 1.0,
        bitcoin: 0.00000995,
        libra: 0.85,
        iene: 186.97,
        peso: 1009.73,
      ),
      CurrencyModel(
        name: 'Bitcoin',
        real: 651000.0,
        dolar: 117772.0,
        euro: 100503.0,
        bitcoin: 1.0,
        libra: 84185.0,
        iene: 18800000.0,
        peso: 105000000.0,
      ),
      CurrencyModel(
        name: 'Libra',
        real: 7.68,
        dolar: 1.39,
        euro: 1.18,
        bitcoin: 0.00001188,
        libra: 1.0,
        iene: 220.49,
        peso: 1224.89,
      ),
      CurrencyModel(
        name: 'Iene',
        real: 0.0347,
        dolar: 0.0063,
        euro: 0.0053,
        bitcoin: 0.000000053,
        libra: 0.0045,
        iene: 1.0,
        peso: 5.56,
      ),
      CurrencyModel(
        name: 'Peso Argentino',
        real: 0.0064,
        dolar: 0.00117,
        euro: 0.00099,
        bitcoin: 0.0000000095,
        libra: 0.00082,
        iene: 0.18,
        peso: 1.0,
      ),
    ];
  }
}
