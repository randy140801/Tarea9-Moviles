import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController latitudController = new TextEditingController();
  TextEditingController longitudController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Ubicacion"),
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Latitud"),
                controller: latitudController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Longitud"),
                controller: longitudController,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Colors.transparent,
                child: BottomAppBar(
                  color: Colors.transparent,
                  child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => map(
                                      lat: double.parse(latitudController.text),
                                      lng:
                                          double.parse(longitudController.text),
                                    ))).then((value) => {
                              if (value != null) {initialise()}
                            });
                      },
                      child: Text(
                        "Buscar",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.green,
      labelStyle: TextStyle(color: Colors.green),
      labelText: labelText,
      fillColor: Colors.green,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.green),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.green,
          width: 2.0,
        ),
      ),
    );
  }

  initialise() {}
}
