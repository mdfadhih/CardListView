import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'User.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
         home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title = 'List of Posts Showing Card View ';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List <User> userList = new List();  
  @override

  void initState()
  {
    _getRequest();
    super.initState();
  } 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (title: Text(widget.title),
      ),
     body: Column(
       children: <Widget>[
         Expanded(
           child: ListView.builder(
             padding: EdgeInsets.all(10.0),
             itemCount: userList.length,
             itemBuilder: (BuildContext context, index){
              return Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                      userList[index].title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                      ),
                   ),
                   SizedBox(
                     height: 5.0,
                   ),
                   Text(
                      userList[index].body,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                   ),
                   SizedBox(
                     height: 5.0,
                   ),
                 ],
                ),
                ),
                elevation: 5.0,
                shadowColor: Colors.black54,
              );     
             },
           ),
        ),
       ],
     ),
    );
  }
    
    Future <List<User>> _getRequest() async
    {
     String url="https://jsonplaceholder.typicode.com/posts";
     Response response = await get(url);
     var rb = response.body;
     var list = json.decode(rb) as List;
     List<User>listValues =list.map((e) => User.fromJson(e)).toList();

     setState(() {
       userList.addAll(listValues);
     });
    }

    

}


