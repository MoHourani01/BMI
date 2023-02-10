import 'package:bmi_project/bmi_screen/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class BMIResultScreen extends StatelessWidget {
  //const BMIResultScreen({Key? key}) : super(key: key);
  final int result;
  final bool isMale;
  final int age;

  BMIResultScreen({
    required this.result,
    required this.isMale,
    required this.age,
  });

  String? status;
  Color? statusColor;
  String? advice;

  @override
  Widget build(BuildContext context) {
    bmiStatus();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF055064),
        title: Text(
          'BMI Result',
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result',
              style: TextStyle(
                fontSize: 30.0,
                color: Color(0xFF317C98),
              ),
            ),
            PrettyGauge(
              gaugeSize: 300,
              segments: [
                GaugeSegment('Underweight', 18.5, Color(0xFF428E9D)),
                GaugeSegment('Normal', 6.4, Color(0xFF317C98)),
                GaugeSegment('Overweight', 5, Color(0xFF1C7186)),
                GaugeSegment('Obesity', 14.1, Color(0xFF055064)),
              ],
              currentValue: result.toDouble(),
              valueWidget: Text('${result}',
                  style: TextStyle(fontSize: 35)),
              needleColor: Color(0xFC162A52),
              minValue: 0,
              maxValue: 44,
            ),
            SizedBox(
              height: 12.0,
            ),
              Text(
              status!,
              style: TextStyle(
                fontSize: 20.0,
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              advice!,
              style: TextStyle(
                  fontSize: 15.0,
                  color: statusColor,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFF055064),
                ),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Re-Calculate',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void bmiStatus(){
    if (result<=18.5){
      status='Undreweight';
      advice='You need to increase your weight';
      statusColor=Color(0xFF428E9D);
    }
    else if(result>18.5 && result<25){
      status='Normal';
      advice='Your BMI is Normal try to keep yourself balance';
      statusColor=Color(0xFF317C98);
    }
    else if(result>=25 && result <30){
      status='Overweight';
      advice='You need to decrease your weight';
      statusColor=Color(0xFF1C7186);
    }else if(result>30){
      status='Obesity';
      advice='You need to work hard to decrease your weight';
      statusColor=Color(0xFF055064);
    }
  }
}  
