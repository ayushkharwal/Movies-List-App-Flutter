import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import 'package:movies_list_app/models/movie.dart';

part 'movies_list_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  Box<Movie> movieBox = Hive.box<Movie>('movies');

  @observable
  List<Movie> movies = [];

  _MovieStore() {
    movies = movieBox.values.toList().cast<Movie>();
  }

  @action
  void addMovie(Movie movie) {
    movieBox.add(movie);
    movies = List.from(movieBox.values.toList().cast<Movie>());
  }
}
