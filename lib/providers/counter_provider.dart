import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _counter =0;
  int get counter => _counter;

  void increment(){
    _counter++;
    notifyListeners();
  }

  void descrement(){
    _counter--;
    notifyListeners();
  }
}