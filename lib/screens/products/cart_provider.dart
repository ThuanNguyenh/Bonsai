import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{

  int _counter = 0 ;
  int get counter => _counter;

  double _totalPrice = 0.0 ;
  double get totalPrice => _totalPrice;

  void _setPrefItems() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('cart_item', _counter);
    preferences.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

}