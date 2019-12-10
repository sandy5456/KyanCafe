import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/Get_Cart_Model.dart';

import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/foods_response.dart';

import 'package:rxdart/rxdart.dart';

class GetCartBloc {
  final _repository = Repository();
  final _getCartFetcher = PublishSubject<List<GetCartModel>>();

  Observable<List<GetCartModel>> get getAllCartItems => _getCartFetcher.stream;

  fetchAllGetCartItem() async {
    List<GetCartModel> categoryModel = await _repository.fetchAllGetCartItems();
    _getCartFetcher.sink.add(categoryModel);
  }

  dispose() async {
    await _getCartFetcher.drain();
    _getCartFetcher.close();
  }
}

final getCartBloc = GetCartBloc();
