import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planet/sign_in.dart';
import 'package:flutter_planet/widgets/ScrollingListview.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => load());
  }

  load() async {
    loggedIn = await hasAuth();
    setState(() {});
  }

  signIn() async {
    await signInWithGoogle();
    load();
  }

  logout() async {
    await signOutGoogle();
    load();
  }

  @override
  Widget build(BuildContext context) {
    int commitmentsCount = 256;
    return Scaffold(
      backgroundColor: Colors.white,
//      drawer: mainDrawer(context),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              iconTheme: new IconThemeData(color: Colors.green),
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
              actions: [
                if (loggedIn)
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/page2');
                    },
                    icon: Icon(Icons.account_circle),
                  ),
                if (loggedIn)
                  IconButton(
                    onPressed: () {
                      logout();
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.green,
                    ),
                  ),
                if (!loggedIn)
                  InkWell(
                    onTap: () {
                      signIn();
                    },
                    child: Container(
                      height: 30.0,
                      width: 30,
                      child: Image.asset("images/google-logo.png"),
                    ),
                  ),
              ]),
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Text(
                      "Recent Commitments",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[400]),
                    ),
                  ),
                ),

                ScrollingList(),

                SizedBox(height: 50.0),
                //Data table tag wise
                Container(
                    margin: EdgeInsets.only(right: 0.0),
                    decoration: ShapeDecoration(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300]))),
                    child: CommitmentTable()),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Drawer mainDrawer(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Flutter Planet'),
            decoration: BoxDecoration(
              color: Colors.green[200],
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/first');
            },
          ),
          ListTile(
            title: Text('Committments'),
            onTap: () {
              Navigator.pushNamed(context, '/page3');
            },
          ),
          ListTile(
            title: Text('Post Video'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
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
              //height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("./images/planet.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(255, 255, 255, 0.7), BlendMode.softLight),
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
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

class ScrollingList extends StatelessWidget {
  final CollectionReference recentCommitments =
      Firestore.instance.collection('recent_commitments');
  @override
  Widget build(BuildContext context) {
    List<String> recentCommits = [];
    return StreamBuilder<QuerySnapshot>(
      stream: recentCommitments.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        var docs = snapshot.data.documents;
        docs.sort((a, b) => (b.data["date"]).compareTo(a.data["date"]));
        recentCommits = (docs).map((e) {
          return "${e.data["name"].toString()} from ${e.data["country"].toString()} commits to ${e.data["commit"].toString()}";
        }).toList();

        return ScrollingListview(recentCommits);
      },
    );
  }
}

class CommitmentTable extends StatelessWidget {
  final CollectionReference commitmentsByTag =
      Firestore.instance.collection('commitments');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: commitmentsByTag.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return DataTable(
          columnSpacing: 37.0,
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
          rows: snapshot.data.documents.map((e) {
            return DataRow(
              cells: [
                DataCell(Text(
                  e.data["description"],
                  style: kDataCellStyle,
                )),
                DataCell(Text(
                  e.documentID,
                  style: kDataCellStyle,
                )),
                DataCell(Text(
                  e["count"].toString(),
                  style: kDataCellStyle,
                ))
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
