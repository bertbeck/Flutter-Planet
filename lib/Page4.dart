import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  List<String> _locations = ['one', 'two', 'three'];
   TextEditingController descriptionController = TextEditingController();
   String _selectedLocations;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4'),
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
            RaisedButton(onPressed: (){
              Navigator.pushNamed(context, '/p3');
            },
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