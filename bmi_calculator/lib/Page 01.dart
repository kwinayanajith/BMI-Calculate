import 'package:bmi_calculator/seeMoreDetails.dart';
import 'package:flutter/material.dart';

class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({Key? key}) : super(key: key);

  @override
  State<BMI_Calculator> createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double bmiResult = 0; // Declare bmiResult at the class level
  String bmiCategory = "";

  calculateBMI() {
    setState(() {
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);

      // BMI formula: weight (kg) / (height (m) * height (m))
      bmiResult = weight / ((height / 100) * (height / 100));

      // Determine BMI category
      if (bmiResult < 16) {
        bmiCategory = "Severe undernourishment";
      } else if (bmiResult <= 16.9) {
        bmiCategory = "Medium undernourishment";
      } else if (bmiResult <= 18.4) {
        bmiCategory = "Slight undernourishment";
      } else if (bmiResult <= 24.9) {
        bmiCategory = "Normal nutrition state";
      } else if (bmiResult <= 29.9) {
        bmiCategory = "Overweight";
      } else if (bmiResult <= 39.9) {
        bmiCategory = "Obesity";
      } else {
        bmiCategory = "Pathological obesity";
      }
    });

    _showResultDialog();
  }

  _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Color(0xFF2b3258),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "BMI Result",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                Text("${bmiResult.toStringAsFixed(2)}",style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                )),
                SizedBox(height: 10),
                Text(
                  "$bmiCategory",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  icon: Icon(Icons.close, color: Colors.white),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFFFF0066)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeeMorePage(bmiResult: bmiResult, bmiCategory: '',),
                      ),
                    );
                  },
                  child: Text(
                    "See More",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b0f34),
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Color(0xFF0b0f34),
        title: Text('BMI Calculator', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Height (in cm)",
                  filled: true,
                  fillColor: Colors.white10,
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Weight (in kg)",
                  filled: true,
                  fillColor: Colors.white10,
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
                  child: Text("Calculate BMI",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  )),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFF0066)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF2b3258),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(16),
                        leading: Icon(Icons.circle, color: Colors.blueGrey),
                        title: Text(
                          "BMI Result: ${bmiResult.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Handle "See More" button press
                        },
                        child: Text("See More",style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFFFF0066)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
