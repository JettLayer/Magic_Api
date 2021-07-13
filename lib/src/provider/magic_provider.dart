import 'package:dio/dio.dart';
import 'package:magic_api/src/model/magic_model.dart';

class CardsProvider {
  final _url = 'https://api.magicthegathering.io/v1/cards';
  final _http = Dio();

  Future<List<CardsModel>> tomarCartas() async {
    final _response = await _http.get(_url);
    List<dynamic> _cards = _response.data['cards'];
    final listaCartas =
        _cards.map((cards) => CardsModel.fromJasonMap(cards)).toList();
    return listaCartas;
  }
}
