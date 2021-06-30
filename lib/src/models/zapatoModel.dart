import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {

  String _assetImage = 'assets/imgs/azul.png';
  int _talle = 41;

  String get assetImage => this._assetImage;
  set assetImage( String valor) {
    this._assetImage = valor;
    notifyListeners();
  }

  int get talle => this._talle;
  set talle( int valor) {
    this._talle = valor;
    notifyListeners();
  }

}