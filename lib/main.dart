import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var wtController= TextEditingController();
var ftController= TextEditingController();
var inController= TextEditingController();
var result= "";
var bgcol= Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALC"),
      ),
      body: Container(
        color: bgcol,
        child: Center(
          child: Container(width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(
                    fontSize: 34,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 20,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your weight: (kgs) "),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height: (ft) "),
                    prefixIcon: Icon(Icons.height)
                  ),
                keyboardType:  TextInputType.number,
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text("Enter your height: (inch) "),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType:  TextInputType.number,
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){
                  var wt= wtController.text.toString();
                  var ft= ftController.text.toString();
                  var inc = inController.text.toString();

                  if(wt!="" && ft!="" && inc!=""){
                    var iwt= int.parse(wt);
                    var ift= int.parse(ft);
                    var iinc= int.parse(inc);
                    var tinc= (ift*12)+iinc;
                    var tcm= tinc*2.54;
                    var tm = tcm/100;
                    var bmi= iwt/(tm*tm);
                    var msg='';
                    if(bmi>25){
                      msg= "You're overweight!!";
                      bgcol= Colors.red.shade300;
                    }
                    else if(bmi<18){
                      msg= "You're underweight!!";
                      bgcol= Colors.yellow.shade500;

                    }
                    else{
                      msg="You're healthy weight!!";
                      bgcol= Colors.green.shade400;

                    }

                    setState(() {
                      result= "Your BMI is: ${bmi.toStringAsFixed(2)}\n $msg";
                    });
                  }
                  else{
                    setState(() {
                      result= "Please fill all 3 fields !";
                    });
                  }

                }, child: Text("Calculate"))
             , SizedBox(height: 15,),
                Text(result, style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
        ),
      )
    );
  }
}
