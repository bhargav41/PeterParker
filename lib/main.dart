// @dart=2.9
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gmap/pages/signup.dart';
import 'package:gmap/screens/search.dart';
import 'package:provider/provider.dart';

import 'services/geolocator_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return FutureProvider<Position>(
      create: (context) => locatorService.getLocation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PeterParker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUp(),
      ),
    );
  }
}
