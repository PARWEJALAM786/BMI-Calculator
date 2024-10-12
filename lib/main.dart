import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result= "  ";
  var bgColor;



  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Container(

        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI",style: TextStyle(fontSize: 34,
                  fontWeight: FontWeight.w600),
                  ),

                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter Your weight (in kg)',style: TextStyle(fontSize: 20,
                      color: Colors.black),),
                     prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                   ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height (in feet)',style: TextStyle(fontSize: 18,
                            color: Colors.black),),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),


                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text("Enter Your Height (in Inch)",style: TextStyle(fontSize: 18,
                      color: Colors.black),),
                        prefixIcon: Icon(Icons.height)

                  ),
                  ),

                  SizedBox(height:15,),


                  ElevatedButton(onPressed:(){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt!="" && ft!="" && inch!=""){
                      //bmi calulation

                      var iWt = int.parse(wt);
                      var iFeet = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch= (iFeet*12) + iInch;

                      var tCm = tInch*2.54;

                      var tM = tCm/100;

                      var bmi =iWt/(tM*tM);

                      var msg="";

                      if(bmi>25){
                        msg = "You are OverWeight!!";
                        bgColor=Colors.red.shade400;
                      }
                      else if(bmi<18){
                        msg = "You are UnderWeight!!";
                        bgColor=Colors.orangeAccent.shade100;

                      }
                      else{
                        msg = "You are Healthy!!";
                        bgColor=Colors.green.shade300;

                      }

                      setState(() {
                        result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}";

                      });

                    }else{
                      setState(() {
                       result="Please fill all the required blanks!!";
                       bgColor=Colors.white;
                      });
                    }



                  } , child:Text("Calculate",style: TextStyle(fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),)),
                  SizedBox(height: 11,),

                  Text(result,style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
