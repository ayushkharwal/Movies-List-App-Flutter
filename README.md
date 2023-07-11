# Movie List Flutter App
This Flutter application allows users to create, update, and delete movies. It utilizes Hive for local storage and MobX for state management.

## Output
https://github.com/ayushkharwal/Movies-List-App-Flutter/assets/64960113/eee46a54-f4f2-4ffa-b070-09b4ed5ddd8a

## Features
* Add movies: Users can add new movies to the list by providing details such as title, genre, director, and release year.
* Update movies: Users can update existing movies by modifying their details.
* Delete movies: Users can remove movies from the list.
* Local storage: The app utilizes Hive, a lightweight and fast NoSQL database, to store movie data locally on the device.
* State management: MobX, a state management library, is used to manage and update the application state efficiently.

## Project Structure
The project follows a standard Flutter project structure:

* lib/: Contains the main application code.
* main.dart: Entry point of the application.
* models/: Contains the data model classes for movies.
* screens/: Contains the UI screens for the app.

## Dependencies
The app uses the following dependencies:
* hive: ^2.2.3
* hive_flutter: ^1.1.0
* mobx: ^2.2.0
* flutter_mobx: ^2.0.6
* intl: ^0.17.0
* path_provider: ^2.0.15
Make sure to check the pubspec.yaml file for the latest versions of the dependencies.

License
This project is licensed under the MIT License. Feel free to use, modify, and distribute the code as per the terms of the license.
