import 'package:flutter/material.dart';
import 'package:flutter_planet/widgets/ScrollingListview.dart';
import 'package:marquee/marquee.dart';

import './data.dart';
import 'constants.dart';

const kAppMessage = //"";
    "Welcome to Flutter Planet - the app that commits you to save the planet! Please make a commitment and share with the world!";

const kAppbarHeight = 350.0;
const kHeaderStyle = TextStyle(color: kTextColour, fontSize: 20.0);
const kTextColour = Color.fromARGB(230, 10, 32, 47);
bool loggedIn = false;

class HomePage extends StatelessWidget {

  String commiterListxx = '''
Bert B, Chicago IL USA, commits to planting a tree\n
Watsa Ch, Lampang Thailand, commits to not using plastic bags\n
Sterling W, Boulder CO USA, commits to ending racism\n
Shivani Gupta India, commits to helping older people\n
Ashita Gupta, India, commits to using electric vehicles\n
Anurag Dalmia India, commits to more efficient software to reduce cpu power\n
Jignesh Patel, India, commits to eating more local food and shopping for local goods\n
  ''';

    List<String> commiterList = [
"Bert B from Chicago IL USA, commits to:\n   planting a tree",
"Watsa Ch from Lampang Thailand commits to:\n   not using plastic bags",
"Sterling W from Boulder CO USA commits to:\n  ending racism",
"Shivani from Gupta India commits to:\n   helping older people",
"Ashita Gupta from India commits to:\n   using electric vehicles",
"Anurag Dalmia from India commits to:\n   more efficient software to reduce cpu power",
"Jignesh Patel from India commits to:\n   eating more local food and shopping for local goods"
    ];

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
                color: Colors.green[500],
                fontSize: 40.0,
                letterSpacing: 2.0,
                shadows: List.filled(
                    1,
                    Shadow(
                        color: Colors.white,
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      kAppMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900], //kTextColour,
                          wordSpacing: 2.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20.0,
                    ), 
                        RaisedButton(
                            onPressed: () {},
                            child: Text(
                              "Google Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color.fromRGBO(37, 122, 20, 1)),

ScrollingListview(commiterList),                            
                                                       
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
              height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("./images/planet.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(255, 255, 255, 0.7), BlendMode.lighten),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 55.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    SizedBox(
                      height: 220.0,
                    ),
                    // Text(
                    //   kAppMessage,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       fontSize: opacity * 23.0,
                    //       color: Colors.blue[600], //kTextColour,
                    //       wordSpacing: 2.0,
                    //       fontWeight: FontWeight.w400),
                    // ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   "Please Login   ",
                        //   style: TextStyle(
                        //       color: kTextColour,
                        //       fontSize: opacity * 15.0,
                        //       fontWeight: FontWeight.bold),
                        // ),
                      //   RaisedButton(
                      //       onPressed: () {},
                      //       child: Text(
                      //         "Google Login",
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //       color: Color.fromRGBO(37, 122, 20, opacity)),
                      ],
                    ),
                    Text(
                      "$commitmentsCount Total Commitments",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue[800], //kTextColour,
                        fontSize: opacity * 20.0,
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
