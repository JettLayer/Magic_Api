import 'package:flutter/material.dart';
import 'package:magic_api/src/model/magic_model.dart';

class DetallesCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CardsModel cards = ModalRoute.of(context)!.settings.arguments as CardsModel;
    return Scaffold(
      appBar: AppBar(
        primary: false,
        iconTheme: IconThemeData(color: cards.colorRarity),
        backgroundColor: cards.colorRarity,
      ),
      body: SingleChildScrollView(
        child: _Data(cards),
      ),
    );
  }
}

class _Data extends StatelessWidget {
  final CardsModel card;
  _Data(this.card);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800.0,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInImage(
              width: 250.0,
              placeholder: AssetImage('assets/Loading.gif'),
              image: AssetImage('assets/Magic_logo.png'),
            ),
            Text(
              card.name!,
              style: TextStyle(fontSize: 29.0, fontWeight: FontWeight.bold),
            ),
            Text(''),
            Text(''),
            Text('Rarity',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            Text(card.rarity!,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: card.colorRarity)),
            Text('Type',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            Text(card.type!,
                style: TextStyle(
                  fontSize: 20.0,
                )),
            Text(
              'Power',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(card.power!,
                style: TextStyle(
                  fontSize: 20.0,
                )),
            Text(
              'Toughness',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(card.toughness!,
                style: TextStyle(
                  fontSize: 20.0,
                )),
            Text(
              'Text of the card',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(
              card.text!,
              style: TextStyle(
                fontSize: 20.0,
              ),
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
    );
  }
}
