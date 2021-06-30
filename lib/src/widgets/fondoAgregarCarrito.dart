import 'package:appshoes/src/widgets/widgets.dart';
import 'package:flutter/material.dart';


class AgregarCarritoBoton extends StatelessWidget {

  final int precio;

  const AgregarCarritoBoton({
    this.precio
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100)
        ),

        child: Row(
          children: [
            SizedBox(width: 20,),
            Text('\$$precio', style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold ),),
            Spacer(),
            BotonNaranja(texto: 'Agregar al carrito'),
            SizedBox(width: 20,)
          ],
        ),

      ),
    );
  }
}