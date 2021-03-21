import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Color primaryColor = const Color(0XFF053F5E);
Color AccentColor = const Color(0XFFFFD700);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(accentColor: AccentColor),
        debugShowCheckedModeBanner: false,
        home: BmiHomePage());
  }
}

class BmiHomePage extends StatefulWidget {
  @override
  _BmiHomePageState createState() => _BmiHomePageState();
}

class _BmiHomePageState extends State<BmiHomePage> {
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.40,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Result Container Starts
                  Container(
                    child: Text("Result",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w300)),
                    margin: EdgeInsets.only(top: 32.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 54,left: 70),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start
                      ,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "BMI:  ",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0,
                              ),
                              children: [
                                TextSpan(
                                    text: result.toString(),
                                    style: TextStyle(
                                  color: Colors.white,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold
                                ))
                              ]),
                        ),
                        SizedBox(height: 32.0),
                        RichText(
                          text: TextSpan(
                              text: "Condition:  ",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0,
                              ),
                              children: [
                                TextSpan(
                                    text: condition,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold
                                    ))
                              ]),
                        ),
                      ],
                    ),
                  ),
                  //Result Container Ends
                ],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  bmiTextField("Enter your Height (Centimeters)", _heightController),
                  SizedBox(height: 24.0),
                  bmiTextField("Enter your weight (Kilograms)", _weightController),
                  SizedBox(height: 108.0),
                  CalculateButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//TextField
  Widget bmiTextField(String HintText, TextEditingController Controller) {
    return TextField(
      controller: Controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        alignLabelWithHint: true,
        hintText: HintText,
        hintStyle: TextStyle(color: Colors.grey[650]),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[350]),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[350]),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }

  Widget CalculateButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.0),
          elevation: 0.0,
          primary: AccentColor,
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0))),
      onPressed: BMICalculation,
      child: Text(
        "CALCULATE",
        style: TextStyle(color: primaryColor, fontSize: 16.0),
      ),
    );
  }

  int result = 0;
  int height_in_mtr;
String condition="None";

  void BMICalculation() {
    int height = int.parse(_heightController.text);
    int weight = int.parse(_weightController.text);

    // height_in_mtr=.toInt();
    setState(() {
      result = (weight / ((height / 100) * (height / 100))).round().toInt();
if(result>=18.5 && result<=25){
  condition="Normal";
}
else if (result>=25 && result<=30) {
  condition="OverWieght";
}
else if (result>30) {
  condition="Obesity";
}
else{
  condition="UnderWeight";
}

    });
  }
}
