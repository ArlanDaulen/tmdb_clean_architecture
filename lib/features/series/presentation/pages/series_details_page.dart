import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SeriesDetialsPage extends StatelessWidget {
  const SeriesDetialsPage({Key? key, @PathParam() required this.seriesId}) : super(key: key);
  final int seriesId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Series Details Page'),
      ),
    );
  }
}