import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_task/Design/homepage.dart';
import 'package:wm_task/provider/authProvider.dart';


class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var email = TextEditingController();
  var name = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
final authprovider = Provider.of<Auth_Provider>(context);
  
    return Scaffold(
     
      body: SingleChildScrollView(
              child: Column(
          children: [
            Container(
              height: height/3.5,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/qwerty.png",),fit: BoxFit.fill),
                
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                  )
                ]


              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  SizedBox(
                    height: height/3,
                    width: width/3,
                    child: Image.asset("assets/images/prof.png",fit: BoxFit.contain,))
                ],
              ),
            ),
            SizedBox(height: height/20,),
            Form(
              key: _formkey,
              child: Column(
                  children: [
                    SizedBox(
                      width: width/1.2,
                      child: TextFormField(
                        validator: (value)
                        {
                          if(value == null || value.isEmpty)
                          {
                            return "Enter Some Value";
                          }
                          return null;
                        },
                        //autovalidateMode: true,
                        controller: name,
                        decoration: InputDecoration(
                          labelText: "Enter Name"
                        ),
                      )),
                      SizedBox(
                        height: height/40,
                      ),
                    SizedBox(
                      width: width/1.2,
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty || value.contains('@') != true)
                          {
                            return "Enter Some Valid Email";
                          }
                          return null;
                        },
                        controller: email,
                      decoration: InputDecoration(
                        labelText: "Enter Email"
                      ),
                    )),
                    SizedBox(height: height/15,),

                    SizedBox(
                      width: width/1.5,
                      child: ElevatedButton(onPressed: (){

                        if(_formkey.currentState!.validate())
                        {
                                                  authprovider.Submit(name.text.toString(), email.text.toString(), context);


                        }


                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage() ));
                      }, child: Text("Submit")))

                  ],

                  ),
                
              ),
          ],

        ),
      ),
      
    );
  }
}