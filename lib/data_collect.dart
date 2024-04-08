import 'package:flutter/material.dart';

import 'Result_Page.dart';

class DataCollect extends StatefulWidget {
  const DataCollect({super.key});

  @override
  State<DataCollect> createState() => _DataCollectState();
}

class _DataCollectState extends State<DataCollect> {
  double height = 0.0;


  int weight = 50;
  int age = 20;


  double bmi = 0.0;


  bmi_calculation(){

    setState(() {

      bmi = (weight/(height*height));
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff291240),
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff1d0a36),
          
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff463573),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 195,
                      width: 175,
                      child: Column(
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 120,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff463573),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 195,
                      width: 175,
                      child: Column(
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                            size: 120,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff463573),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 195,
                  width: 370,
                  child: Column(
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Height",
                          labelStyle: TextStyle(
                            color: Colors.white
                          )
                        ),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        onChanged: (input) {
                          height = double.parse(input);
                        },
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff463573),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 195,
                      width: 175,
                      child: Column(
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff463573),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 195,
                      width: 175,
                      child: Column(
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ClipOval(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.pink,
                height: 55,
                width: 370,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {
                    bmi_calculation();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(bmi_reslt: bmi.toString(),)), // Change result_page to ResultPage()
                    );
                  },
                  child: Text("Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
