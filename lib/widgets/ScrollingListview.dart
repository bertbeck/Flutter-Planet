import 'dart:async';

import 'package:flutter/material.dart';

class ScrollingListview extends StatefulWidget {
  List<String> list;

  ScrollingListview(this.list);

  @override
  _ScrollSyncState createState() => _ScrollSyncState();
}

class _ScrollSyncState extends State<ScrollingListview> {
  final itemSize = 20.0;

  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_controller.offset >= 200)
        _controller.jumpTo(0);
      else
        _controller.animateTo(_controller.offset + 10,
            curve: Curves.linear, duration: Duration(milliseconds: 2000));
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        controller: _controller,
        itemCount: widget.list.length,
        //itemExtent: itemSize,
        itemBuilder: (context, index) {
          return ListTile(title: Text(widget.list[index]));
        },
      ),
    );
  }
}
