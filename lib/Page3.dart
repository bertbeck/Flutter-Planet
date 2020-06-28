import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<String> _locations = ['one', 'two', 'three'];
   TextEditingController descriptionController = TextEditingController();
   String _selectedLocations;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
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
        Container(
           padding: EdgeInsets.only(left: 20 , right: 20 , top: 20 ),
           height: 250,
           width: 350,
            child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black)),
                    ),
                     keyboardType: TextInputType.multiline,
                      maxLines: 8
                  ),
        ),
       RaisedButton(
         onPressed: (){
           Navigator.pushNamed(context, '/p2');
         },
          child: Text('Add Video',style: TextStyle(color: Colors.white),),
          color: Theme.of(context).accentColor,
          )
      ],
      ),
      )
    );
  }
}