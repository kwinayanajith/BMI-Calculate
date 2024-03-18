import 'package:flutter/material.dart';

class SeeMorePage extends StatefulWidget {
  final double bmiResult;
  final String bmiCategory;

  const SeeMorePage(
      {Key? key, required this.bmiResult, required this.bmiCategory})
      : super(key: key);

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
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 24),
                      ),
                      Text(
                        "${widget.bmiResult.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text("Stay",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                          )),
                      Text("HEALTHY,",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Text("STRONG",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 36,
                              fontWeight: FontWeight.w200)),
                      SizedBox(height: 10,),
                      Text(
                        "Healthy Habits,",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Happy Life !",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "images/man.png",
                  width: 210,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text(
                "To maintain a healthy BMI, focus on eating nutritious foods like fruits, vegetables, and lean proteins while avoiding processed snacks and sugary beverages. Pair your balanced diet with regular exercise for optimal health and weight management.",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.justify, // Align text justified
                maxLines: 10, // Adjust the number of lines as per your requirement
              ),
            ),

          ],
        ),
      ),
    );
  }
}
