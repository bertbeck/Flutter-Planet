import 'package:flutter/material.dart';

import './data.dart';

const APP_MESSAGE =
    "Welcome to Flutter Planet - the app that commits to save the planet! Please make a commitment and share with the world!";

const APP_BAR_HEIGHT = 350.0;

class HomePage extends StatelessWidget {
  final List<DataRow> userTableRows = commitmentsByUser.map((e) {
    return DataRow(
      cells: [
        DataCell(Text(e["name"]), onTap: () {
          //Page2(e["name"])
        }),
        DataCell(Text(e["location"])),
        DataCell(Text(e["commit"]))
      ],
    );
  }).toList();
  final List<DataRow> commitmentTableRows = commitmentsByTag.map((e) {
    return DataRow(
      cells: [
        DataCell(Text(e["commit"])),
        DataCell(Text(e["tag"])),
        DataCell(Text(e["count"].toString()))
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
            title: Text(
              "Flutter Planet",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey[700], fontSize: 40.0),
            ),
            pinned: true,
            centerTitle: true,
            expandedHeight: APP_BAR_HEIGHT,
            flexibleSpace: AppBarContent(commitmentsCount: commitmentsCount),
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
                        label: Text("Name"),
                      ),
                      DataColumn(
                        label: Text("Location"),
                      ),
                      DataColumn(
                        label: Text("I Commit"),
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
                        label: Text("Commitment"),
                      ),
                      DataColumn(
                        label: Text("Tag"),
                      ),
                      DataColumn(label: Text("# People"), numeric: true),
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
        double opacity = top / APP_BAR_HEIGHT;
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
                      Color.fromRGBO(255, 255, 255, 0.3), BlendMode.lighten),
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
                          color: Colors.blueGrey[700],
                          fontSize: opacity * 30.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      APP_MESSAGE,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: opacity * 23.0,
                          color: Colors.blueGrey[900],
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Please Login   ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: opacity * 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        RaisedButton(
                            onPressed: () {},
                            child: Text("Google"),
                            color: Color.fromRGBO(25, 200, 100, opacity)),
                      ],
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
