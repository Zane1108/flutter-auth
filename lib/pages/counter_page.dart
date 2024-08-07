import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  @override

  var counter = 1;

  void incrementCounter(){
    setState(() {
      if(counter >= 100){
         final snackBar = SnackBar(
          content: const Text('Geus limit kehed'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        counter++;
      }
          
    });
  }
  void decrementCounter(){
    setState(() {
      if(counter <= 1){
        final snackBar = SnackBar(
          content: const Text('Atos Kang ,Tos kurang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
         counter--;
      }
         
     });
  }
  Widget build(BuildContext context) {
   
    return Container(
      color: Colors.red,
      width:double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('Perulangan ke :',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
          ),
          Text('$counter',
             style: TextStyle(
                fontSize: counter.toDouble(),
                color: Colors.white,
              ),
          ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  decrementCounter();
                },
                child: Icon(Icons.remove),
              ),
              SizedBox(height: 20),
               ElevatedButton(
                onPressed: () {
                  incrementCounter();
                },
                child: Icon(Icons.add),
               ),
            ],
          )
        ],
      ),
    );
  }
}







