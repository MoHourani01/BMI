import 'dart:math';

import 'package:bmi_project/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class BMIScreen extends StatefulWidget {
  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  // const BMIScreen({Key? key}) : super(key: key);
  bool isMale = true;
  double height = 175.0;
  int age = 18;
  int weight = 45;
  bool isFinished = false;
  // double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF055064),
        title: Text('BMI Calculater'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: isMale == true
                                ? Color(0xFC162A52)
                                : Color(0xFF055064),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/male2.png',
                                ),
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: isMale == true
                                ? Color(0xFF055064)
                                : Color(0xFC162A52),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/female2.png',
                                ),
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFF055064),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'CM',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        min: 150,
                        max: 210,
                        activeColor: Color(0xFC162A52),
                        inactiveColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFF055064),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${weight}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFC162A52),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                              mini: true,
                              heroTag: 'weight-',
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFC162A52),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                              mini: true,
                              heroTag: 'weight+',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 175,
                    decoration: BoxDecoration(
                      color: Color(0xFF055064),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.white),
                        ),
                        Text(
                          '${age}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFC162A52),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                              mini: true,
                              heroTag: 'age-',
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFC162A52),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                              mini: true,
                              heroTag: 'age+',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwipeableButtonView(
                isFinished: isFinished,
                onFinish: () async{
                  setState(() {
                    isFinished=true;
                  });
                  double result = weight / pow(height / 100, 2);
                  print(result!.round());
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BMIResultScreen(
                            result: result.round(),
                            isMale: isMale,
                            age: age,
                          )));
                  setState(() {
                    isFinished=false;
                  });
                },
                onWaitingProcess: () {
                  double result = weight / pow(height / 100, 2);
                  Future.delayed(Duration(seconds: 1),(){
                    setState(() {
                      isFinished = true;
                    });
                  });
                },
                activeColor: Color(0xFF055064),
                buttonWidget: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF055064),
                ),
                buttonText: 'Calculate BMI',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
