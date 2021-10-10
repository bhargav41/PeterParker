// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gmap/models/place.dart';
import 'package:gmap/screens/login.dart';
import 'package:gmap/screens/signup.dart';
import 'package:gmap/screens/search.dart';
import 'package:gmap/screens/splash.dart';
import 'package:gmap/services/places_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'services/geolocator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        FutureProvider(
          create: (context) {
            ImageConfiguration configuration =
                createLocalImageConfiguration(context);
            return BitmapDescriptor.fromAssetImage(
                configuration, 'assets/parking-icon.png');
          },
        ),
        ProxyProvider2<Position, BitmapDescriptor, Future<List<Place>>>(
          update: (context, position, icon, places) {
            return (position != null)
                ? placesService.getPlaces(
                    position.latitude, position.longitude, icon)
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
        home: Splash(),
      ),
    );
  }
}
