import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ola_mundo/app/models/currency_model.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel>? items;
  final TextEditingController? controller;
  final ValueChanged<CurrencyModel?>? onChanged;
  final CurrencyModel? selectedItem;
  final bool readOnly; 

  const CurrencyBox({ Key? key,
    this.items,
    this.controller,
    this.onChanged,
    this.selectedItem,
    this.readOnly = false, 
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CurrencyModel>(
                dropdownColor: Colors.grey[850],
                isExpanded: true,
                iconEnabledColor: Colors.amber,
                style: const TextStyle(color: Colors.white),
                value: selectedItem,
                items: items ?.map((e) => DropdownMenuItem(value: e, child: Text(e.name)), ).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: TextField(
              readOnly: readOnly, 
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Valor',
                labelStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true, ),
              inputFormatters: readOnly
                  ? [] 
                  : [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
            ),
          ),
        ],
      ),
    );
  }
}
