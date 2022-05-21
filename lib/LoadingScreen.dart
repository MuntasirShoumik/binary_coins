import 'package:flutter/material.dart';
import 'Network.dart';
import 'ExchangeRateScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final String coinName;
  LoadingScreen({required this.coinName});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<String> rates = [];
  var navigationResult;
  var errorCode;
  bool errorOccurred = false;

  getRate(String coin) async {
    try {
      var coinRates = await Network().getExchangeRates(coin);
      rates = coinRates;
      navigationResult = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExchangeRateScreen(
            rates: rates,
          ),
        ),
      );
      if (navigationResult == 'pop') {
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() {
        errorOccurred = true;
        errorCode = e;
      });
    }
  }

  @override
  void initState() {
    getRate(widget.coinName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: errorOccurred ? getErrorMessage() : getLoadingAnimation(),
    );
  }

  Widget getLoadingAnimation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinKitSpinningCircle(
          color: Colors.yellow[700],
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text('Loading...')
      ],
    );
  }

  Widget getErrorMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('images/eicon.png'),
            height: 100.0,
            width: 100.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            errorCode.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Card(
              color: Colors.blue[300],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '<- Go back',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
