import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_task/Design/get_Started.dart';
import 'package:wm_task/provider/authProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> Auth_Provider()),

 ],
    child: Builder(builder: (BuildContext context){

      return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  GetStarted(),
    );
    }),
    
    
    );
    
  }
}

