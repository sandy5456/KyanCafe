
import 'package:fatburger/JSON_DATA/repository/repositories.dart';
import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/Offer_product_model.dart';
import 'package:fatburger/model/foods_response.dart';

import 'package:rxdart/rxdart.dart';

class OfferProductBloc {
  final _repository = Repository();
  final _offerProductFetcher = PublishSubject<List<OfferProductModel>>();

  Observable<List<OfferProductModel>> get allofferProducts =>
      _offerProductFetcher.stream;

  fetchAllOfferProduct() async {
    List<OfferProductModel> categoryModel =
        await _repository.fetchAllOfferPRoducts();
    _offerProductFetcher.sink.add(categoryModel);
  }

  dispose() async {
    await _offerProductFetcher.drain();
    _offerProductFetcher.close();
  }
}

final offerproductBloc = OfferProductBloc();
