import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import "dart:convert";
import 'widgets/image_list.dart';


class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var parsedJson = json.decode(response.body);
    var imageModel = new ImageModel.fromJson(parsedJson);
    
    setState(() {
      images.add(imageModel);
    });
    
  
  }

  Widget build(context) {
    return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
      appBar: AppBar(
        title: Text('Let\'s See Images')
      )
    )
  );
  }
}

