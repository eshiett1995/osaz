import 'package:flutter/material.dart';

import 'custom-widgets/badge.dart';

class Needs extends StatefulWidget {
  @override
  _NeedsState createState() => _NeedsState();
}

class _NeedsState extends State<Needs> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Needs"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search needs/wants',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
          color: Colors.white,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
            itemCount: 2,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new BadgeIconButton(
                            itemCount: (index + 1).toString(),
                            badgeColor: Colors.blue,
                            badgeTextColor: Colors.white,
                            icon: new Icon(Icons.people),
                            onPressed: () {}),
                        new SizedBox(
                          width: 40.0,
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Toilet Roll",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            new SizedBox(
                              height: 10.0,
                            ),
                            new Text(
                              "this is needed for the children to............",
                              style: TextStyle(
                                fontSize: 11.0,
                              ),
                            ),
                          ],
                        ),
                        new Container(
                          child: Transform.translate(
                            offset: Offset(80.0, 23.0),
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              child: new Text("2/10",
                                style: TextStyle(
                                  fontSize: 25.0
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          )),
    );
  }
}
