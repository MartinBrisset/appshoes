import 'package:appshoes/src/helpers/helpers.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:appshoes/src/models/zapatoModel.dart';
import 'package:appshoes/src/widgets/widgets.dart';
import 'package:provider/provider.dart';


class ZapatoDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: [

          Stack(
            children: [

              Hero(
                tag: 'zapato-1',
                child: ZapatoPrevia( fullScreen: true, )
              ),

              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                ),
              )

            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),

                  _MontoComprar(),

                  _Colores(),

                  _BotonesOpciones()

                ],
              ),
            ),
          )

        ],
      ),
   );
  }
}

class _BotonesOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          _BotonSombreado( Icon(Icons.star, color: Colors.red, size: 25,)),
          _BotonSombreado( Icon(Icons.shopping_cart_outlined, color: Colors.grey.withOpacity(0.4), size: 25,)),
          _BotonSombreado( Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25,)),
          
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {

  final Icon icono;

  const _BotonSombreado(
    this.icono
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icono,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0,10)
          )
        ]
      ),
    );
  }
}

class _Colores extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [

          Expanded(
            child: Stack(
              children: [
                Positioned(left: 90, child: _BotonColor( Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(left: 60, child: _BotonColor( Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
                Positioned(left: 30, child: _BotonColor( Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
                _BotonColor( Color(0xff364D56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),

          BotonNaranja(texto: 'Más opciones', alto: 30, ancho: 140, color: Color(0xffFFC675),)

        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color color;
  final int indice;
  final String rutaFoto;

  const _BotonColor(
    this.color, 
    this.indice, 
    this.rutaFoto
  );

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.indice * 150),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.rutaFoto;

        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoComprar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: [
            Text('\$3990', style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold),),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(texto: 'Comprar', ancho: 120, alto: 40,)
            )
          ],
        ),
      ),
    );
  }
}