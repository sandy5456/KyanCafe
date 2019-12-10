import 'package:fatburger/JSON_DATA/repository/repositories.dart';

import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/foods_response.dart';

import 'package:rxdart/rxdart.dart';

class OfferImageBloc {
  final _repository = Repository();
  final _imageFetcher = PublishSubject<List<OfferImageModel>>();

  Observable<List<OfferImageModel>> get allofferImages => _imageFetcher.stream;

  fetchAllOfferImage() async {
    List<OfferImageModel> categoryModel = await _repository.fetchAllImages();
    _imageFetcher.sink.add(categoryModel);
  }

  dispose() async {
    await _imageFetcher.drain();
    _imageFetcher.close();
  }
}

final offerImageBloc = OfferImageBloc();
