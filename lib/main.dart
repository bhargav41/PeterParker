// @dart=2.9
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gmap/models/place.dart';
import 'package:gmap/pages/signup.dart';
import 'package:gmap/screens/search.dart';
import 'package:gmap/services/places_service.dart';
import 'package:provider/provider.dart';

import 'services/geolocator_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<Position>(
            create: (context) => locatorService.getLocation()),
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            return (position != null)
                ? placesService.getPlaces(position.latitude, position.longitude)
                : null;
          },
        )
      ],
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
