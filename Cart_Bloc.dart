import 'package:fatburger/JSON_DATA/providers/Cart_api.dart';
import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/MODEL/Cart_Model.dart';

import 'package:rxdart/rxdart.dart';

class CartBloc {
  final _repository = Repository();
  final _cartFetcher = PublishSubject<CartModel>();


  Observable<CartModel> get allCartItems => _cartFetcher.stream;

  fetchCartItems(String phoneNnumber) async {
    CartModel cartModel =
        await _repository.fetchAllCartItems(phoneNnumber);
    _cartFetcher.sink.add(cartModel);
  }

  addproductToCart(String productId, String phone,String quantity) {
    _repository.addProductToCart(productId, phone,quantity);
  }

  removeProductFromCart(String productId,String phone) {
    _repository.removeProductFromCart(productId,phone);
  }

  dispose() async {
    await _cartFetcher.drain();
    _cartFetcher.close();
  }
}

final cartBloc = CartBloc();