import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'custom-widgets/badge.dart';
import 'needs.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //GoogleMapsPlaces _places =
  //  GoogleMapsPlaces(apiKey: "AIzaSyBOGkO9x4t9MYhUkRTdNRQo-1odXVRJhDA");

  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _showPlaceBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  void _onMapLongTapped(LatLng location) {}

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    //mapController.addPolyline(options);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: new GoogleMap(
            onMapCreated: _onMapCreated,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            rotateGesturesEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: mapController == null ? _center : LatLng(10, 10),
              zoom: 11.0,
            ),
          ),
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              height: 180,
              width: 700,
              child: new ListView(
                scrollDirection: Axis.horizontal, // <-- Like so
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: new Column(
                        children: <Widget>[

                          new Text(
                              "St. marys boys",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                            ),
                          ),

                          new SizedBox(height: 5.0,),
                          new Text(
                            "Road 40, H36, Victoria garden city, lekki, lagos, ajah.",
                            style: new TextStyle(color: Colors.black54),
                          ),
                          new SizedBox(height: 10.0,),


                          new Row(
                            children: <Widget>[
                              new BadgeIconButton(
                                  itemCount: (44).toString(),
                                  badgeColor: Colors.blue,
                                  badgeTextColor: Colors.white,
                                  icon: new Icon(Icons.people, size: 40.0,),
                                  onPressed: () {}),
                            ],
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 5.0),
                                child: new OutlineButton(
                                    child: new Text("Details"),
                                    onPressed: null,
                                    highlightedBorderColor: Colors.white,
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0))
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                                child: new OutlineButton(
                                    child: new Text("Needs"),
                                    onPressed: () {
                                      var route = new MaterialPageRoute(
                                          builder: (BuildContext context) => new Needs(),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0))
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 300.0,
                    decoration: new BoxDecoration(
                      color: Colors.lightBlueAccent, //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 300.0,
                    decoration: new BoxDecoration(
                      color: Colors.lightBlueAccent, //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
            ),
          ],
        ),

        /** new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: 270.0,
                    height: 30.0,
                    child: new TextFormField(
                      //onChanged: (v)=>setState((){loginEmail=v;}),

                      decoration: new InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(Icons.pin_drop,),
                          contentPadding: const EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          border: new OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                            gapPadding: 1.0,
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  )
                ],
              )
            ],
          )**/
      ],
    ));
  }
}
