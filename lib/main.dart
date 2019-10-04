import 'package:flutter/material.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: new FTCalculatorPage(title: 'Calculator'),
    );
  }
}

class FTCalculatorPage extends StatefulWidget{
  FTCalculatorPage({Key key, this.title}):super(key:key);
  final String title;
  @override
  _FTCalculatorPageState createState() => new _FTCalculatorPageState();
}

class _FTCalculatorPageState extends State<FTCalculatorPage>{
  String output ="0";
  String _output ="0";
  double num1=0;
  double num2=0;
  String operand="";

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:new Container(
        child: new Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            padding:new EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
            ),
            child: new Text(
              output, style: new TextStyle(
                fontSize: 48.0,
              fontWeight: FontWeight.bold,)
              ),
          ),
          new Expanded(
            child: new Divider(),
          ),
          new Column(children: [
            new Row(children: [
              ftCalcButton("7"),
              ftCalcButton("8"),
              ftCalcButton("9"),
              ftCalcButton("/")
            ],),

            new Row(children: [
              ftCalcButton("4"),
              ftCalcButton("5"),
              ftCalcButton("6"),
              ftCalcButton("*")
            ],),

            new Row(children: [
              ftCalcButton("1"),
              ftCalcButton("2"),
              ftCalcButton("3"),
              ftCalcButton("-")
            ],),

            new Row(children: [
              ftCalcButton("."),
              ftCalcButton("0"),
              ftCalcButton("00"),
              ftCalcButton("+")
            ],),

            new Row(children: [
              ftCalcButton("Clear"),
              ftCalcButton("="),
            ],)
          ],)
        ],)
      ),
    );
  }
Widget ftCalcButton(String buttonText){
  return new Expanded(
    child:new OutlineButton(
      padding: new EdgeInsets.all(24.0),
      child: new Text(buttonText,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold),
        ),
        onPressed: ()=>buttonPressed(buttonText)
    )
  );
}




buttonPressed(String buttonText){
  if(buttonText=="Clear"){
    _output="0";
    num1=0.0;
    num2=0.0;
    operand="";
  }
  else if(buttonText=="+"||buttonText=="-"||buttonText=="*"||buttonText=="/"){
    num1=double.parse(output);
    operand=buttonText;
    _output="0";
  }
  else if(buttonText=="."){
    if(_output.contains(".")){
      print("Already Contains a Decimal");
      return;
    }
    else{
      _output=_output+buttonText;
    }
  }
  else if(buttonText=="="){
    num2=double.parse(output);
    if(operand=="+"){
      _output=(num1+num2).toString();
    }
    if(operand=="-"){
      _output=(num1-num2).toString();
    }
    if(operand=="*"){
      _output=(num1*num2).toString();
    }
    if(operand=="/"){
      _output=(num1/num2).toString();
    }
    num1=0;
    num2=0;
    operand="";
  }
  else{
    _output=_output+buttonText;
  }
  print(_output);
  setState(() {
   output=double.parse(_output).toStringAsFixed(2); 
  });
}


}



