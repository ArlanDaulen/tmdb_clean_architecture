import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PeopleDetailsPage extends StatelessWidget {
  const PeopleDetailsPage({Key? key, @PathParam() required this.peopleId}) : super(key: key);
  final int peopleId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('People Details Page'),
      ),
    );
  }
}