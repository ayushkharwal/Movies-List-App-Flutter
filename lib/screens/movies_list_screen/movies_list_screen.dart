import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:movies_list_app/models/movie.dart';
import 'package:movies_list_app/screens/add_movie_screen/add_movie_screen.dart';
import 'package:movies_list_app/screens/movies_list_screen/store/movies_list_store.dart';

class MovieListScreen extends StatefulWidget {
  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final Box<Movie> _moviesBox = Hive.box<Movie>('movies');

  final MovieStore? store = MovieStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie List',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MovieFormScreen(store: store)),
          );
        },
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(58, 66, 86, 1.0),
          size: 30,
        ),
      ),
      body: Observer(
        builder: (_) {
          //final movies = _moviesBox.values.toList();
          final movies = store?.movies;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: movies?.length,
            itemBuilder: (_, index) {
              final movie = movies?[index];
              return Dismissible(
                key: Key(movie!.key.toString()),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (_) => _moviesBox.deleteAt(index),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(88, 98, 118, 0.898),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        movie.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${movie.director} (${movie.year})',
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MovieFormScreen(
                                    movie: movie,
                                    store: store,
                                  )),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
