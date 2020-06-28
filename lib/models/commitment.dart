import 'dart:ui';

import 'package:flutter/material.dart';

class Commitment {
  final String commitment;
  final String tag;
  final String status;

  Commitment({this.commitment, this.tag, this.status});

  Color fromStatus(){
    if(status == 'doing'){
      return Colors.orangeAccent;
    }else{
      return Colors.greenAccent;
    }
  }

  factory Commitment.fromMap(Map<String, dynamic> map) {
    return Commitment(commitment: 'Commitment', tag: 'tag', status: 'status');
  }

  static List<Commitment> dummy(){
    return [
      Commitment(commitment: 'End racism', tag: 'EndRacism', status: 'doing'),
      Commitment(commitment: 'Plant a tree', tag: 'Plant', status: 'done'),
      Commitment(commitment: 'Make a new friend', tag: 'NewFriend', status: 'doing'),
      Commitment(commitment: 'Help an older person', tag: 'HelpOlder', status: 'done'),
      Commitment(commitment: 'Stop using plastic bags', tag: 'StopPlastic', status: 'doing'),
      Commitment(commitment: 'Use ECO friendly lawn care products', tag: 'EcoLawn', status: 'done'),
      Commitment(commitment: 'End racism', tag: 'EndRacism', status: 'doing'),
      Commitment(commitment: 'Plant a tree', tag: 'Plant', status: 'done'),
      Commitment(commitment: 'Make a new friend', tag: 'NewFriend', status: 'doing'),
      Commitment(commitment: 'Help an older person', tag: 'HelpOlder', status: 'done'),
      Commitment(commitment: 'Stop using plastic bags', tag: 'StopPlastic', status: 'doing'),
      Commitment(commitment: 'Use ECO friendly lawn care products', tag: 'EcoLawn', status: 'done'),
    ];
  }
}
