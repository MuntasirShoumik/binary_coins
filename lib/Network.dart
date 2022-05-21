import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

const List<String> currenciesList = [
  'USD',
  'BRL',
  'CAD',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
];

// https://rest.coinapi.io/v1/exchangerate/ETH/USD?apikey=129B5B24-272D-4F27-8888-8E49A49727CD

const apiKey = '129B5B24-272D-4F27-8888-8E49A49727CD';

class Network {
  Future<List<String>> getExchangeRates(String coinId) async {
    bool connection = await Network().isDeviceConnected();
    if (!connection) {
      throw ('No internet connection');
    }

    List<String> exchangeRates = [];
    for (String currency in currenciesList) {
      String requestUrl =
          'https://rest.coinapi.io/v1/exchangerate/$coinId/$currency?apikey=$apiKey';

      http.Response response = await http.get(Uri.parse(requestUrl));
      print(response.statusCode);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var pricedata = decodedData['rate'];
        int price = pricedata.round();

        exchangeRates.add("1 $coinId = $price $currency ");
        print('inside if');
      } else if (response.statusCode == 550) {
        exchangeRates.add("1 $coinId =   $currency ");
      } else {
        throw ('Something went wrong!');
      }
    }
    print(exchangeRates.length);
    return exchangeRates;
  }

  Future<dynamic> isDeviceConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
