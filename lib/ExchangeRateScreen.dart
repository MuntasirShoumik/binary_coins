import 'package:flutter/material.dart';

class ExchangeRateScreen extends StatefulWidget {
  List<String> rates = [];
  ExchangeRateScreen({required this.rates});

  @override
  _ExchangeRateScreenState createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context, 'pop');
          },
        ),
      ),
      body: Container(
        child: ListView.separated(
          padding: EdgeInsets.all(8),
          itemCount: widget.rates.length,
          itemBuilder: (BuildContext context, int index) {
            return Cards(rate: widget.rates[index]);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  Cards({
    required this.rate,
  });

  final String rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[300],
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          rate,
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
