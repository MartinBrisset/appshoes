import 'package:appshoes/src/helpers/helpers.dart';
import 'package:appshoes/src/widgets/widgets.dart';
import 'package:flutter/material.dart';


class ZapatoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    cambiarStatusDark();

    return Scaffold(
      // body: CustomAppBar(texto: 'Para vos',),
      // body: ZapatoPrevia(),
      body: Column(
        children: [
          CustomAppBar(texto: 'Para Vos'),
          
          SizedBox(height: 20,),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [

                  Hero(
                    tag: 'zapato-1',
                    child: ZapatoPrevia()
                  ),

                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),

                  
                ],
              ),
            ),
          ),

          AgregarCarritoBoton( precio: 3990)

        ],
      ),
   );
  }
}
