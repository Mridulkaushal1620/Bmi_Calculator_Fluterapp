import 'package:flutter/material.dart';
// import 'package:flutter_basics/widgets/Rounded_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(
          headlineLarge : TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 11,fontWeight: FontWeight.w200,fontStyle: FontStyle.italic)
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return myHomePage();
  }

}

class myHomePage extends State<MyHomePage>{
    var wtController = TextEditingController();
    var ftController = TextEditingController();
    var inController = TextEditingController() ;
    var result = "";
    var bgColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Your BMI", style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your weight(in kgs)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height(in Feets)"),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text("Enter you height in(Inches)"),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt !="" && ft !="" && inch !="" ){
                      //BMI calculation
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);
                    var iWt = int.parse(wt);
                    var tInches = (ift*12)+iInch;
                    var tcm = tInches*2.54;
                    var tm = tcm/100;
                    var bmi = iWt/(tm*tm);
                    var msg = "";

                    if(bmi>25){
                      msg = "You'r over weight";
                      bgColor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = "You'r underweight";
                      bgColor = Colors.red.shade200;
                    }
                    else{
                      msg = "You'r healthy";
                      bgColor = Colors.green.shade200;
                    }

                    setState(() {
                      result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                  }
                  else{
                    setState(() {
                      result = "Please fill all the required details!!";
                    });
                  }
                }, child: Text("Calculate")),
                SizedBox(
                  height: 20,
                ),
                Text(result,style: TextStyle(fontSize: 19),),
              ],
            ),
          ),
        ),
      )
    );
  }

}
