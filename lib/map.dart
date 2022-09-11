import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
  double lat;
  double lng;
  map({Key? key, required this.lat, required this.lng}) : super(key: key);
  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  Set<Marker> marker = {};

  void _onmapcreated(GoogleMapController controller) {
    setState(() {
      marker.add(
        Marker(
            markerId: MarkerId("id-1"),
            position: LatLng(widget.lat, widget.lng),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 60,
                      child: Center(
                        child: Text("HOLA"),
                      ),
                    );
                  });
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: GoogleMap(
        onMapCreated: _onmapcreated,
        markers: marker,
        //mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.lng),
          zoom: 18,
        ),
      ),
    );
  }
}
