import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
   List<String> _locations = ['one', 'two', 'three'];
   TextEditingController descriptionController = TextEditingController();
   String _selectedLocations;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 5'),
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
         Container(
           padding: EdgeInsets.only(top: 80,left: 15 , right: 15),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 70,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<String>(
     value: _selectedLocations,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 35,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      hint: Text('Commitments'),
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          _selectedLocations = newValue ;
        });
      },
   items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList()
),
              ],
            )
          ),
           Padding(padding: EdgeInsets.only(right: 20 , left: 40)),
            RaisedButton(onPressed: (){},
            child: Text('Add',style: TextStyle(color: Colors.white),),
            color: Colors.black),
        ],
      ),
         ),
      ]
      )
      )
    );
  }
}