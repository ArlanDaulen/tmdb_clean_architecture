import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key, @PathParam() required this.movieId})
      : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Movie Details Page'),
      ),
    );
  }
}
