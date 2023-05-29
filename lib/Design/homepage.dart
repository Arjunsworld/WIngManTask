import 'package:flutter/material.dart';
import 'package:wm_task/Design/get_Started.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        
      ),
      body: Align(
        alignment: Alignment.center,
        child: Text("Welcome You are now loggedIn",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> GetStarted() ));
      },child: Icon(Icons.logout),),
      
      
    );
  }
}