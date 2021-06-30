import 'package:flutter/material.dart';

import 'package:appshoes/src/pages/zapatoDescPage.dart';

import 'package:appshoes/src/models/zapatoModel.dart';
import 'package:provider/provider.dart';

class ZapatoPrevia extends StatelessWidget {

  final bool fullScreen;

  const ZapatoPrevia({Key key, 
    this.fullScreen = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ( this.fullScreen ) ? 5: 30, 
          vertical: ( this.fullScreen ) ? 5: 0
        ),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: ( !this.fullScreen ) 
                          ? BorderRadius.circular(50)
                          : BorderRadius.only( bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50), topLeft: Radius.circular(40), topRight: Radius.circular(40),)
          ),

          child: Column(
            children: [

              _ZapatoConSombra(),

              if ( !this.fullScreen ) 
                _ZapatoTalles(),

            ],
          ),


        ),
      ),
    );
  }
}

class _ZapatoTalles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          _TalleZapatoCaja(37),
          _TalleZapatoCaja(38),
          _TalleZapatoCaja(39),
          _TalleZapatoCaja(40),
          _TalleZapatoCaja(41),
          _TalleZapatoCaja(42),

        ],
      ),
    );
  }
}

class _TalleZapatoCaja extends StatelessWidget {

  final int numero;

  const _TalleZapatoCaja(
     this.numero
  );

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
    
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talle = this.numero;
        
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('$numero', 
          style: TextStyle(
            color: ( this.numero == zapatoModel.talle ) ? Colors.white : Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: ( this.numero == zapatoModel.talle ) ? Color(0xffF1A23A): Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (this.numero == zapatoModel.talle ) 
              BoxShadow( color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0,5))
            
          ]
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [

          Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()
          ),

          Image( image: AssetImage( zapatoModel.assetImage ), ),
          
          
        ],
      ),
    );
  }
}



class _ZapatoSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 250,
        height: 100,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow( color: Color(0xffEAA14E), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}

