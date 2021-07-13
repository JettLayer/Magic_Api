import 'package:flutter/material.dart';
import 'package:magic_api/src/model/magic_model.dart';
import 'package:magic_api/src/provider/magic_provider.dart';

class MainPage extends StatelessWidget {
  final _providerMagic = CardsProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _providerMagic.tomarCartas(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CardsModel>> snapShot) {
          final listCard = snapShot.data;
          if (snapShot.hasData) {
            return ListView.builder(
                itemCount: listCard!.length,
                itemBuilder: (BuildContext context, int i) {
                  final cards = listCard[i];
                  return _DisenoCard(cards);
                });
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/767eee1b-d349-4726-b9c1-2794d1e8e505/d1zvl9i-3a6ec64b-dcb1-4661-b3ff-c7a4571631d9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzc2N2VlZTFiLWQzNDktNDcyNi1iOWMxLTI3OTRkMWU4ZTUwNVwvZDF6dmw5aS0zYTZlYzY0Yi1kY2IxLTQ2NjEtYjNmZi1jN2E0NTcxNjMxZDkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.g3q2vihwfE-QIVQsA-JVhnBPN0bxM4KL2WEUYBf5nQc',
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}

class _DisenoCard extends StatelessWidget {
  final CardsModel cards;
  _DisenoCard(this.cards);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: _Name(cards),
          // subtitle:
          leading: Text(
            cards.number!,
            style: TextStyle(fontSize: 18.0),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.black,
          ),
          onTap: () => Navigator.pushNamed(context, '/detalles_cartas',
              arguments: cards),
        )
      ],
    );
  }
}

class _Name extends StatelessWidget {
  final CardsModel cards;
  _Name(this.cards);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cards.name!,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          Text(
            'Rarity: ${cards.rarity}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: cards.colorRarity, borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
