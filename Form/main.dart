import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Contacts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(_title),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                      Icons.more_vert
                  ),
                )
            ),
          ],
        ),
        body: const Center(
          child: MyStatefulWidget(

          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String areadropdown = 'Area';
  String statedropdown = 'State';

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 30.0,right: 20.0),
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              border: OutlineInputBorder(),
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child:
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0 ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(),
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: DropdownButton<String>(
                  value: areadropdown,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      backgroundColor: Colors.black12
                  ),

                  underline: Container(
                    height: 2,
                    //color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      areadropdown = newValue!;
                    });
                  },
                  items: <String>['Area', 'Sector1', 'Sector2', 'Sector3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.only( top : 20.0, right: 20.0, left: 10.0),
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              border: OutlineInputBorder(),
              icon: const Icon(Icons.location_on),
              hintText: 'Enter your address',
              labelText: 'Address',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 50.0, right: 20.0, bottom: 20.0),
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              border: OutlineInputBorder(),
              hintText: 'Enter your city',
              labelText: 'City',
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: DropdownButton<String>(
                  value: statedropdown,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      backgroundColor: Colors.black12
                  ),

                  underline: Container(
                    height: 2,
                    //color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      statedropdown = newValue!;
                    });
                  },
                  items: <String>['State', 'M.P.', 'Rajasthan', 'U.P.']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

            ),
            Flexible(
              child:
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(),
                    hintText: 'Enter zip code',
                    labelText: 'Zip',
                  ),
                ),
              ),
            ),


          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 20.0,bottom: 20.0, right: 20.0),
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              border: OutlineInputBorder(),
              icon: const Icon(Icons.email),
              hintText: 'Enter your email ID',
              labelText: 'Email',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:10.0, bottom: 20.0,right: 20.0),
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              border: OutlineInputBorder(),
              icon: const Icon(Icons.cake),
              hintText: 'Enter your date of birth',
              labelText: 'Birthday',
            ),
          ),
        ),
        new Container(
            padding: const EdgeInsets.only(left: 150.0, top: 40.0, right: 150.0),
            child: new RaisedButton(
              child: const Text('Submit'),
              onPressed: null,
            )),
      ],
    );
  }
}



