import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'OrphanageDetail.dart';
import 'custom-widgets/badge.dart';
import 'custom-widgets/starDisplay.dart';
import 'needs.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //GoogleMapsPlaces _places =
  //  GoogleMapsPlaces(apiKey: "AIzaSyBOGkO9x4t9MYhUkRTdNRQo-1odXVRJhDA");

  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  LatLng deviceCurrentLocation = new LatLng(45.521563, -122.677433);

  GoogleMapController mapController;

  void getDeviceCurrentLocation() async{
    await new Location().getLocation().then((locationData){
      deviceCurrentLocation = new LatLng(locationData.latitude, locationData.longitude);
      print("this is the location " + deviceCurrentLocation.longitude.toString() + deviceCurrentLocation.latitude.toString() );
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceCurrentLocation();
    //deviceCurrentLocation = new LatLng(0, 0);
    setState(() {

    });
  }

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
              target: deviceCurrentLocation,
              //target: mapController == null ? _center : deviceCurrentLocation,
              zoom: 11.0,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0.0, 70),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.0),
                    boxShadow: [
                      new BoxShadow (
                        color: Colors.black26,
                        offset: new Offset(0.0, 0.07),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a locatition ...',
                          hintStyle: TextStyle(fontSize: 20.0),
                          prefixIcon: new Icon(Icons.location_on, color: Colors.black, size: 35.0,),
                      ),
                    ),
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new RaisedButton(onPressed: (){}, color: Colors.black, child: new Text("search", style: TextStyle(color: Colors.white, fontSize: 20.0),),)
                  ],
                )
              ],
            ),
          )
        ),
        //InViewNotifierList(),
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
                              IconTheme(
                                data: IconThemeData(
                                  color: Colors.amber,
                                  size: 30,
                                ),
                                child: StarDisplay(value: 3),
                              ),
                            ],
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 5.0),
                                child: new FlatButton(
                                    child: new Text("Details",style: TextStyle(color: Colors.white),),
                                    color: Colors.blue,
                                    onPressed: () {
                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) => new OrphanageDetail(),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0))
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                                child: new FlatButton(
                                    child: new Text("Needs", style: TextStyle(color: Colors.white),),
                                    color: Colors.pinkAccent,
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
                                    child: new Text("Needs", style: TextStyle(fontFamily: 'Montserrat',),),
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
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
            ),
          ],
        ),

      ],
    ));
  }
}
