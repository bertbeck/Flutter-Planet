import 'package:flutter/material.dart';
import 'package:flutter_planet/models/shoutout.dart';

import '../utils.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bert's Page"),
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Commitments',
              ),
              Tab(
                text: 'Shout Outs',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _Commitments(),
            _ShoutOuts(),
          ],
        ),
      ),
    );
  }
}

//class Page2Body extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: [
//        _Commitments(),
//        SizedBox(
//          height: 24,
//        ),
//        _ShoutOuts(),
//      ],
//    );
//  }
//}

class _ShoutOuts extends StatelessWidget {
  List<ShoutOut> shoutouts = ShoutOut.dummy();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final s = shoutouts[index];
        return ListTile(
          title: Text(
            s.comment,
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0),
          ),
          subtitle: Text('- ${s.name}'),
        );
      },
      itemCount: shoutouts.length,
      separatorBuilder: (_, __) => Divider(),
    );
  }
}

class _Commitments extends StatefulWidget {
  @override
  __CommitmentsState createState() => __CommitmentsState();
}

class __CommitmentsState extends State<_Commitments> {
  @override
  Widget build(BuildContext context) {
    List<Commitment> commitments = dummy;
    setState(() {});
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (_, index) {
          final c = commitments[index];
          return ListTile(
            title: Text(
              '${c.commitment}',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0),
            ),
            subtitle: Row(
              children: [
                Chip(
                  label: Text(
                    c.tag,
                    style: Theme.of(context).accentTextTheme.subtitle1,
                  ),
                  backgroundColor: colorFor(c.tag),
                ),
                Spacer(),
                Chip(
                  label: Text(c.status),
                  backgroundColor: c.fromStatus(),
                ),
              ],
            ),
          );
        },
        itemCount: commitments.length,
        separatorBuilder: (_, __) => Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed("/page3");
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class Commitment {
  final String commitment;
  final String tag;
  final String status;

  Commitment({this.commitment, this.tag, this.status});

  Color fromStatus() {
    if (status == 'doing') {
      return Colors.orangeAccent;
    } else {
      return Colors.greenAccent;
    }
  }

  factory Commitment.fromMap(Map<String, dynamic> map) {
    return Commitment(commitment: 'Commitment', tag: 'tag', status: 'status');
  }
}

List<Commitment> dummy = [
  Commitment(commitment: 'End racism', tag: 'EndRacism', status: 'doing'),
  Commitment(commitment: 'Plant a tree', tag: 'Plant', status: 'done'),
  Commitment(
      commitment: 'Make a new friend', tag: 'NewFriend', status: 'doing'),
  Commitment(
      commitment: 'Help an older person', tag: 'HelpOlder', status: 'done'),
  Commitment(
      commitment: 'Stop using plastic bags',
      tag: 'StopPlastic',
      status: 'doing'),
  Commitment(
      commitment: 'Use ECO friendly lawn care products',
      tag: 'EcoLawn',
      status: 'done'),
];
