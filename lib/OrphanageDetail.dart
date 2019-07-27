

import 'package:flutter/material.dart';

class OrphanageDetail extends StatefulWidget {
  @override
  _OrphanageDetailState createState() => _OrphanageDetailState();
}

class _OrphanageDetailState extends State<OrphanageDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: new Stack(
          children: <Widget>[
            Image.network(
              'https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_1280.jpg',
              fit: BoxFit.cover,
              height: 400.0,
              width: double.infinity,
            ),
            AppBar(backgroundColor: Colors.black12,),
            Transform.translate(
              offset: Offset(15.0, 120),
              child: new Text("Orphanage", style: TextStyle(fontSize: 29.0, color: Colors.white),),
            ),
          ],
        )

      ),
      body: new Container(
        margin: EdgeInsets.only(top: 25.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text(
                    "Road 40, H36 Victoria Garden City, lekki Ajah.",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                  ),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Text("Road 40, H36 Victoria Garden City, lekki Ajah.")
              ],
            ),

            SizedBox(height: 50.0,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "66",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.lightBlueAccent
                        ),
                      ),
                      new Text(
                          "Total Children",
                        style: TextStyle(
                            fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "66",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.lightBlueAccent
                        ),
                      ),
                      new Text(
                        "Total Need",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

