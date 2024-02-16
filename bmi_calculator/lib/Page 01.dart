import 'package:flutter/material.dart';

class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({Key? key}) : super(key: key);

  @override
  State<BMI_Calculator> createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double bmiResult = 0;
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
          title: Text("BMI Result"),
          content: Column(
            children: [
              Text("Your BMI is ${bmiResult.toStringAsFixed(2)}"),
              SizedBox(height: 10),
              Text("BMI Category: $bmiCategory"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {  },), // Add the leading icon here
        actions: [Icon(Icons.notifications)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Height (in cm)",
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
              child: Text("Calculate BMI"),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("BMI Result: ${bmiResult.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
