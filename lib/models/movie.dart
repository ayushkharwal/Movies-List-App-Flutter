import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String director;

  @HiveField(2)
  late int year;

  Movie({required this.title, required this.director, required this.year});
}
