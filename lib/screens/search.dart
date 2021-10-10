import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gmap/models/place.dart';
import 'package:gmap/pages/signup.dart';
import 'package:gmap/services/marker_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:gmap/services/geolocator_service.dart';
import 'package:url_launcher/url_launcher.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> list = [
      {
        "title": "Car Parking",
        "rating": 3.5,
        "distance": "1 km",
        "vicinity": "HGMG+HXX",
      },
      {
        "title": "Market Parking Lot",
        "rating": 4.5,
        "distance": "1.32 km",
        "vicinity": "9-12, 2nd Avenue"
      },
      {
        "title": "CK Market Parking",
        "rating": 4.2,
        "distance": "1.5 km",
        "vicinity": "CK-102"
      },
      {
        "title": "Sourav Abasan Parking lot",
        "rating": 5.00,
        "distance": "2 km",
        "vicinity": "EE 209"
      },
      {
        "title": "Thana Road Car Parking",
        "rating": 3.2,
        "distance": "2.1 km",
        "vicinity": "Andal More"
      },
      {
        "title": "HighLea Car Park lot",
        "rating": 4.5,
        "distance": "5 km",
        "vicinity": "South Bazar, Andal"
      },
      {
        "title": "Dolly Parking Area",
        "rating": 5.00,
        "distance": "5.5 km",
        "vicinity": "North Bazar, Andal"
      },
      {
        "title": "Parking Garage",
        "rating": 5.00,
        "distance": "5.9 km",
        "vicinity": "B-L-60"
      },
      {
        "title": "Sen Parking Space",
        "rating": 4.5,
        "distance": "10 km",
        "vicinity": "Durgapur, City Center"
      },
      {
        "title": "Royal Parking",
        "rating": 5.00,
        "distance": "23 km",
        "vicinity": "Kolkata, West Bengal"
      },
    ];

    Set<Marker> _markers = {};

    void _onMapCreated(GoogleMapController controller) {
      setState(() {
        _markers.add(
          const Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(23.402039, 87.547729),
            // icon: mapMarker,
          ),
        );
      });
    }

    List<Marker> locationMarkers = [
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      ),
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      ),
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      ),
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      ),
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      ),
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      ),
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      ),
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      ),
      const Marker(
        markerId: MarkerId("Car Parking"),
        draggable: false,
        // icon: Icon(Icons.local_parking),
        infoWindow: InfoWindow(title: "Car Parking", snippet: "HGMG+HXX"),
        position: LatLng(23.002, 27.345),
      )
    ];

    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);
    final markerService = MarkerService();
    return FutureProvider(
      initialData: null,
      create: (context) => placesProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Peter Parker"),
          ),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {
                MaterialPageRoute(builder: (context) => const SignUp());
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: (currentPosition != null)
            ? Consumer<List<Place>>(
                builder: (_, places, __) {
                  List<Marker> markers =
                      (places != null) ? markerService.getMarkers(places) : [];
                  return (places != null)
                      ? Column(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              child: GoogleMap(
                                onMapCreated: _onMapCreated,
                                markers: _markers,
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(currentPosition.latitude,
                                        currentPosition.longitude),
                                    zoom: 16.0),
                                zoomGesturesEnabled: true,
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            // Expanded(
                            //   child: ListView.builder(
                            //       itemCount: places.length,
                            //       itemBuilder: (context, index) {
                            //         return FutureProvider(
                            //           initialData: null,
                            //           create: (context) =>
                            //               geoService.getDistance(
                            //                   currentPosition.latitude,
                            //                   currentPosition.longitude,
                            //                   places[index]
                            //                       .geometry
                            //                       .location
                            //                       .lat,
                            //                   places[index]
                            //                       .geometry
                            //                       .location
                            //                       .lng),
                            //           child: Card(
                            //             child: ListTile(
                            //               title: Text(places[index].name),
                            //               subtitle: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   SizedBox(height: 3.0),
                            //                   (places[index].rating != null)
                            //                       ? Row(
                            //                           children: [
                            //                             RatingBarIndicator(
                            //                               rating: places[index]
                            //                                   .rating,
                            //                               itemBuilder: (context,
                            //                                       index) =>
                            //                                   Icon(Icons.star,
                            //                                       color: Colors
                            //                                           .amber),
                            //                               itemCount: 5,
                            //                               itemSize: 10.0,
                            //                               direction:
                            //                                   Axis.horizontal,
                            //                             ),
                            //                           ],
                            //                         )
                            //                       : Row(),
                            //                   SizedBox(
                            //                     height: 5.0,
                            //                   ),
                            //                   Consumer<double>(
                            //                     builder:
                            //                         (context, meters, widget) {
                            //                       return (meters != null)
                            //                           ? Text(
                            //                               '${places[index].vicinity} \u00b7 ${(meters / 1000).round()} km')
                            //                           : Container();
                            //                     },
                            //                   ),
                            //                 ],
                            //               ),
                            //               trailing: IconButton(
                            //                 icon: Icon(Icons.directions),
                            //                 onPressed: () {
                            //                   _launchMapUrl(
                            //                       places[index]
                            //                           .geometry
                            //                           .location
                            //                           .lat,
                            //                       places[index]
                            //                           .geometry
                            //                           .location
                            //                           .lng);
                            //                 },
                            //                 color: Colors.green,
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }),
                            // )

                            Expanded(
                              child: ListView.builder(
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        title: Text("${list[index]['title']}"),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 3.0),
                                            (list[index]['rating'] != null)
                                                ? Row(
                                                    children: [
                                                      RatingBarIndicator(
                                                        rating: list[index]
                                                            ['rating'],
                                                        itemBuilder: (context,
                                                                index) =>
                                                            Icon(Icons.star,
                                                                color: Colors
                                                                    .amber),
                                                        itemCount: 5,
                                                        itemSize: 10.0,
                                                        direction:
                                                            Axis.horizontal,
                                                      ),
                                                    ],
                                                  )
                                                : Row(),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                                '${list[index]['vicinity']} \u00b7 ${list[index]['distance']}')
                                          ],
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.directions),
                                          onPressed: () {
                                            _launchMapUrl(23.5012, 88.4917);
                                          },
                                          color: Colors.green,
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  void _launchMapUrl(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    await launch(url);
  }
}
