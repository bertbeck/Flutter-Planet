import 'package:flutter/material.dart';
import 'package:flutter_planet/models/commitment.dart';
import 'package:flutter_planet/models/shoutout.dart';

import '../utils.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bert's Page"),
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

class Page2Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Commitments(),
        SizedBox(
          height: 24,
        ),
        _ShoutOuts(),
      ],
    );
  }
}

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
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          subtitle: Text('- ${s.name}'),
        );
      },
      itemCount: shoutouts.length,
      separatorBuilder: (_, __) => Divider(),
    );
  }
}

class _Commitments extends StatelessWidget {
  List<Commitment> commitments = Commitment.dummy();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final c = commitments[index];
        return ListTile(
          title: Text(
            '${c.commitment}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          subtitle: Row(
            children: [
              Chip(label: Text(c.tag, style: Theme.of(context).accentTextTheme.subtitle1,), backgroundColor: colorFor(c.tag),),
              Spacer(),
              Chip(label: Text(c.status), backgroundColor: c.fromStatus(),),
            ],
          ),
        );
      },
      itemCount: commitments.length,
      separatorBuilder: (_, __) => Divider(),
    );
  }
}

