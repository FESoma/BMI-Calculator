import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  //const ResultPage({super.key});

 String bmi_reslt;
 ResultPage({required this.bmi_reslt});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  String result = '';
  String advice = '';
  late Color color;

  condition(){

    if(double.parse(widget.bmi_reslt)<18){
      setState(() {
        result = 'Underweight';
        advice = 'Seek professional guidance for healthy weight gain strategies.';
        color = Colors.amber;
      });

    }else if(double.parse(widget.bmi_reslt)>18 && double.parse(widget.bmi_reslt)<24){
      setState(() {
        result = 'Normal';
          advice = 'Focus on maintaining this healthy weight.';
          color =Colors.greenAccent;
      });
    }else
      setState(() {
        result='Overweight';
        advice = 'Adopt a balanced diet and exercise regularly.';
        color = Colors.red;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    condition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff291240),
        leading: Icon(Icons.arrow_back,
        color: Colors.white,
        ),
        title: Center(
          child: Text("BMI Calculator",
            style: TextStyle(
              color: Colors.white
            ),

          ),
        ),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff1d0a36),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text("Your Result",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff463573),
                  borderRadius: BorderRadius.circular(10),

              ),
                height: 400,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(result,
                        style: TextStyle(
                          fontSize: 30,
                          color: color
                        ),
                        ),
                        Text(widget.bmi_reslt,
                        style: TextStyle(
                            fontSize: 30,
                            color: color
                        ),

                        ),
                        Text(advice,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),

                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.pink,
              height: 55,
              width: 370,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink
                ),
                  onPressed:(){
                    Navigator.pop(context);

                  },
                  child: Text("RE-Calculate",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            )
          ],

        ),

      ),
    );
  }
}
