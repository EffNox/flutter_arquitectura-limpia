import 'package:flutter/material.dart';
import 'package:i18n/app/models/product.dart';
import 'package:i18n/translations.g.dart';
import 'package:intl/intl.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _show(context),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child: Image.network(product.image, fit: BoxFit.cover)),
                  Positioned(
                    right: 5,
                    child: Chip(label: Text(NumberFormat('###.#').format(product.rate))),
                  ),
                ],
              ),
            ),
            Text(product.name),
            Text(
              // NumberFormat('###,###.##', 'es_ES').format(product.price),
              NumberFormat.currency(/* customPattern: '###,###.##' */).format(product.price),
              style: const TextStyle(fontSize: 20),
            ),
            Text(DateFormat.yMEd().format(product.releaseDate)),
          ],
        ),
      ),
    );
  }

  Future<void> _show(BuildContext context) {
    selectDateRange() => showDateRangePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2050));

    // final t = Translations.of(context); NO ES NECESARIO PORQUE EN EL ARCHIVO SLANG SE CONFIGURO "translate_var" CON t por defecto

    return showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(t.summary, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              Text(t.productName(name: product.name, emoji: '🤙')),
              Text(t.price(price: NumberFormat.currency().format(product.price))),
              Text(t.releaseDate(date: DateFormat.yMMMMEEEEd().format(product.releaseDate))),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        t.successfulPay,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.pop(context);
                  },
                  child: Text(t.payNow(total: NumberFormat.currency().format(product.price))),
                ),
              ),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: selectDateRange, child: Text(t.payDues)))
            ],
          ),
        ),
      ),
    );
  }
}
