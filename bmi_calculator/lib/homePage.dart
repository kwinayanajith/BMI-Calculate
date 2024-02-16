import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _height = TextEditingController();
  final _weight = TextEditingController();

  int userPostHeight = 0;
  int userPostWeight = 0;

  add (){
    int result = userPostWeight+userPostHeight;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        children: [
          Container(
            child: Text(userPostHeight.toString()), // Convert int to String
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _height,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Weight",
                suffixIcon: IconButton(
                  onPressed: () {
                    _height.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                userPostHeight = int.tryParse(_height.text) ?? 0;
              });
            },
            color: Colors.blue,
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),

          Container(
            child: Text(userPostWeight.toString()), // Convert int to String
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _weight,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Weight",
                suffixIcon: IconButton(
                  onPressed: () {
                    _weight.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                userPostWeight = int.tryParse(_weight.text) ?? 0;
              });
            },
            color: Colors.blue,
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
          
          
          TextButton(onPressed: () {
            double beduwamagana = userPostHeight/userPostWeight;
          }, child: Text("data")),
          
          Text("Your bedima : }"),

          
        ],
      ),
    );
  }
}



