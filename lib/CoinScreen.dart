import 'package:flutter/material.dart';
import 'LoadingScreen.dart';

class CoinScreen extends StatefulWidget {
  @override
  _CoinScreenState createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  var navigationResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '₿ Binary Coins',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CoinCard(
              imageDirectory: 'images/bitcoin_b.jpg',
              coinName: 'BitCoin',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadingScreen(coinName: 'BTC')));
              },
            ),
            CoinCard(
              imageDirectory: 'images/eth_b.jpg',
              coinName: 'Ethereum',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadingScreen(coinName: 'ETH')));
              },
            ),
            CoinCard(
              imageDirectory: 'images/doge_b.jpg',
              coinName: 'DogeCoin',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadingScreen(coinName: 'DOGE')));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  final String imageDirectory;
  final String coinName;
  final VoidCallback onTap;

  CoinCard(
      {required this.imageDirectory,
      required this.coinName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 20,
            shadowColor: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  opacity: 60.0,
                  fit: BoxFit.cover,
                  image: AssetImage(imageDirectory),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  coinName,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
