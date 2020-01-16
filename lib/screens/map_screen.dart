import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  final String title = 'Map';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  LatLng _center = const LatLng(45.521563, -122.677433);

  List<LatLng> _pointsDataSource = [
    LatLng(45.61073477925647, -122.67983615398407),
    LatLng(45.54513158002791, -122.59263217449188),
    LatLng(45.54873814139096, -122.74472415447234),
    LatLng(45.47054417067575, -122.67537295818329),
    LatLng(45.4500755188941, -122.57443606853484),
    LatLng(45.43586349747191, -122.7636069059372),
    LatLng(45.4069466451227, -122.66781985759734),
  ];

  Set<Marker> _markers = Set<Marker>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  GestureDetector _couponCell(LatLng point) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8),
        width: 200,
        height: 100,
        child: Container(
          decoration: BoxDecoration(color: Colors.red),
        ),
      ),
      onTap: () {
        _onMapTap(point);
      },
    );
  }

  void _onMapTap(LatLng point) {

    mapController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(zoom: 11.0, target: point))
    );
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        GoogleMap(
          markers: _markers,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _pointsDataSource.length,
              itemBuilder: (BuildContext context, int index) {
                var point = _pointsDataSource[index];

                return _couponCell(point);
              },
            ),
          ),
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
