import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:appshoes/src/models/zapatoModel.dart';
import 'package:appshoes/src/pages/zapatoPage.dart';
 
void main() {

  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ZapatoModel())
      ],
      child: MyApp()
    )
  );
  
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calzado App',
      debugShowCheckedModeBanner: false,
      home: ZapatoPage(),
    );
  }
}