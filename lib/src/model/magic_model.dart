import 'package:flutter/cupertino.dart';
import 'package:magic_api/const/colores.dart';

class CardsModel {
  String? name;
  String? type;
  String? rarity;
  String? text;
  String? number;
  String? power;
  String? toughness;
  //String? imageUrl;
  Color? colorRarity;

  CardsModel({
    this.name,
    this.number,
    this.power,
    this.rarity,
    this.text,
    this.toughness,
    this.type,
    //this.imageUrl
  }) {
    this.colorRarity = Colores.colors[rarity!];
  }
  factory CardsModel.fromJasonMap(Map<String, dynamic> cards) => CardsModel(
        name: cards['name'],
        type: cards['type'],
        rarity: cards['rarity'],
        text: cards['text'],
        number: cards['number'],
        power: cards['power'],
        toughness: cards['toughness'],

        //imageUrl: cards['imageUrl']
      );
}
