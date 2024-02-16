import 'package:flutter/material.dart';

class SeeMorePage extends StatefulWidget {
  final double bmiResult;
  final String bmiCategory;

  const SeeMorePage({Key? key, required this.bmiResult, required this.bmiCategory}) : super(key: key);

  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b0f34),
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Color(0xFF0b0f34),
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Add back button
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF2b3258),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Your BMI is",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24),
                      ),
                      Text(
                        "${widget.bmiResult.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "${widget.bmiCategory}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
