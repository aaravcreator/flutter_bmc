import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int counter = 0;
  int scoreA = 0;
  int scoreB = 0;
  int maxScore = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(color:Colors.blue,icon:Icon(Icons.add),onPressed: (){ 
        print('btn pressed');
       
        setState(() {
          counter ++;
        });
        print(counter);
      }, ) ,
      appBar: AppBar(title: Text('ScoreKeeper')),
      body: Column(
        
        children: [
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
        Column(

          children: [

            Text("Player A",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green)),
           Text('${scoreA}',style: TextStyle(fontSize: 30),),
           FloatingActionButton(onPressed: (){

            setState(() {
              scoreA ++;

            });
           },child:Icon(Icons.add)),
           FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: (){
            setState(() {
              scoreA --;
              
            });
            },child:Icon(Icons.remove))
          ],
        ),
        Column(

          children: [

              Text("Player B",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.blue)),
             Text('${scoreB}',style: TextStyle(fontSize: 30),),
            FloatingActionButton(onPressed: (){
            setState(() {
              scoreB ++;
              
            });
            },child:Icon(Icons.add)),
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: (){
            setState(() {
              scoreB --;
              
            });
            },child:Icon(Icons.remove))
          ],
        )
       ],),

       _renderWinner(),

       FloatingActionButton(
        backgroundColor: Colors.red,onPressed: (){
        setState(() {
          scoreA = 0;
          scoreB = 0;
        });
       },
       child: Icon(Icons.close),)

       
      ]),
    );
  }


  Widget _renderWinner(){
    if (scoreA >= maxScore || scoreB >= maxScore) {
      if(scoreA>scoreB){
        return Center( child :Text("Player A Wins", style:TextStyle(color:Colors.red,fontSize: 30)));
      }
      else{
        return Center( child :Text("Player B wins ", style:TextStyle(color:Colors.red,fontSize: 30)));
      }
  }
  else{
    return Center( child :Text("Game is running", style:TextStyle(color:Colors.blue,fontSize: 30)));
  }}
}