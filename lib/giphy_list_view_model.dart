import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/giphy.dart';

class GiphyListViewModel {
  final PublishSubject<String> searchTerm;
  final Observable<List<Giphy>> giphies;
  factory GiphyListViewModel() {
    final searchTerm = PublishSubject<String>();
    final giphies = searchTerm
        .distinct()
        .debounce(Duration(milliseconds: 250))
        .switchMap( (text) => Giphy.searchStream(text))
        .startWith(List<Giphy>(0));
    return GiphyListViewModel._(searchTerm, giphies);
  }
  GiphyListViewModel._(this.searchTerm, this.giphies);
}