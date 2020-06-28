import 'package:flutter/material.dart';

import './data.dart';
import 'constants.dart';

bool loggedIn = false;

class HomePage extends StatelessWidget {
  final List<DataRow> userTableRows = commitmentsByUser.map((e) {
    return DataRow(
      cells: [
        DataCell(
            Text(
              e["name"],
              style: kDataCellStyle,
            ), onTap: () {
          //Page2(e["name"])
        }),
        DataCell(Text(
          e["location"],
          style: kDataCellStyle,
        )),
        DataCell(Text(
          e["commit"],
          style: kDataCellStyle,
        ))
      ],
    );
  }).toList();
  final List<DataRow> commitmentTableRows = commitmentsByTag.map((e) {
    return DataRow(
      cells: [
        DataCell(Text(
          e["commit"],
          style: kDataCellStyle,
        )),
        DataCell(Text(
          e["tag"],
          style: kDataCellStyle,
        )),
        DataCell(Text(
          e["count"].toString(),
          style: kDataCellStyle,
        ))
      ],
    );
  }).toList();
  @override
  Widget build(BuildContext context) {
    int commitmentsCount = 256;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Flutter Planet",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextColour,
                fontSize: 40.0,
                letterSpacing: 2.0,
                shadows: List.filled(
                    1,
                    Shadow(
                        color: Colors.blueGrey[900],
                        blurRadius: 10.0,
                        offset: Offset(2, 3))),
              ),
            ),
            pinned: true,
            centerTitle: true,
            expandedHeight: kAppbarHeight,
            flexibleSpace: AppBarContent(commitmentsCount: commitmentsCount),
            actions: loggedIn == true
                ? [
                    IconButton(
                      onPressed: () {
                        //logout if logged in
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.green,
                      ),
                    )
                  ]
                : null,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                //Data table name wise
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  decoration: ShapeDecoration(
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]))),
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          "Name",
                          style: kHeaderStyle,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Location",
                          style: kHeaderStyle,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "I Commit",
                          style: kHeaderStyle,
                        ),
                      ),
                    ],
                    rows: userTableRows,
                  ),
                ),
                SizedBox(height: 50.0),
                //Data table tag wise
                Container(
                  decoration: ShapeDecoration(
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]))),
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          "Commitment",
                          style: kHeaderStyle,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Tag",
                          style: kHeaderStyle,
                        ),
                      ),
                      DataColumn(
                          label: Text(
                            "# People",
                            style: kHeaderStyle,
                          ),
                          numeric: true),
                    ],
                    rows: commitmentTableRows,
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarContent extends StatelessWidget {
  final int commitmentsCount;
  AppBarContent({this.commitmentsCount});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        double top = constraints.biggest.height;
        double opacity = top / kAppbarHeight;
        opacity = opacity > 1 ? 1 : opacity < 0.2 ? 0.0 : opacity;
        return Opacity(
          opacity: opacity,
          child: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("./images/planet.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(255, 255, 255, 0.7), BlendMode.lighten),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "$commitmentsCount Total Commitments",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kTextColour,
                        fontSize: opacity * 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      kAppMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: opacity * 23.0,
                          color: kTextColour,
                          wordSpacing: 2.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    loggedIn == true
                        ? RaisedButton(
                            onPressed: () {},
                            child: Text(
                              "My Profile",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color.fromRGBO(37, 122, 20, opacity))
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 120.0),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              onPressed: () {},
                              color: Color.fromRGBO(37, 122, 20, 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Please Login   ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: opacity * 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Image.asset(
                                      "images/google-logo.png",
                                      height: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//
//Padding(
//padding: EdgeInsets.symmetric(
//horizontal: 48.0, vertical: 24.0),
//child: Row(
//children: [
//Text("Username"),
//SizedBox(
//width: 20.0,
//),
//Expanded(
//child: TextField(
//decoration: InputDecoration(
//border: OutlineInputBorder(
//borderSide: BorderSide(
//color: Colors.blueGrey,
//),
//),
//),
//)),
//],
//),
//),
//Padding(
//padding: EdgeInsets.symmetric(
//horizontal: 48.0, vertical: 24.0),
//child: Row(
//children: [
//Text("Password"),
//SizedBox(
//width: 20.0,
//),
//Expanded(
//child: TextField(
//decoration: InputDecoration(
//border: OutlineInputBorder(
//borderSide: BorderSide(
//color: Colors.blueGrey,
//),
//),
//),
//)),
//],
//),
//),
