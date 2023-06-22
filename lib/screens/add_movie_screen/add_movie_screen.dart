import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:movies_list_app/models/movie.dart';
import 'package:movies_list_app/screens/add_movie_screen/widgets/custom_text_field.dart';
import 'package:movies_list_app/screens/movies_list_screen/store/movies_list_store.dart';

class MovieFormScreen extends StatefulWidget {
  final Movie? movie;
  MovieStore? store;

  MovieFormScreen({this.movie, this.store});

  @override
  _MovieFormScreenState createState() => _MovieFormScreenState();
}

class _MovieFormScreenState extends State<MovieFormScreen> {
  final Box<Movie> _moviesBox = Hive.box<Movie>('movies');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _directorController;
  late TextEditingController _yearController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.movie?.title ?? '');
    _directorController = TextEditingController(text: widget.movie?.director ?? '');
    _yearController = TextEditingController(text: widget.movie?.year?.toString() ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _directorController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _saveMovie() {
    if (_formKey.currentState?.validate() ?? false) {
      final title = _titleController.text;
      final director = _directorController.text;
      final year = int.tryParse(_yearController.text) ?? 0;

      if (widget.movie != null) {
        widget.movie!.title = title;
        widget.movie!.director = director;
        widget.movie!.year = year;
        widget.movie!.save();
      } else {
        final movie = Movie(title: title, director: director, year: year);
        widget.store?.addMovie(movie);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: Text(
          widget.movie != null ? 'Edit Movie' : 'Add Movie',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                textEditingController: _titleController,
                labelText: 'Title',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                textEditingController: _directorController,
                labelText: 'Director',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                textEditingController: _yearController,
                labelText: 'Year',
                textInputType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a year';
                  }
                  if (int.tryParse(value ?? '') == null) {
                    return 'Please enter a valid year';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMovie,
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(88, 98, 118, 0.898),
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
