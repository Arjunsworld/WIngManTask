
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:wm_task/Design/otp_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:wm_task/provider/authProvider.dart';
class GetStarted extends StatefulWidget {
  

  @override
  State<GetStarted> createState() => _GetStartedState();
}




class _GetStartedState extends State<GetStarted> {
final _formkey = GlobalKey<FormState>();




// Future getotp() async 
//     {
//       var url = "https://test-otp-api.7474224.xyz/sendotp.php?";

//       var response = await http.post(Uri.parse(url),body: {
//         "mobile" : "8888888888"
//       });

      

//       print(response.body.toString());
           

//     }








  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    final authprovider = Provider.of<Auth_Provider>(context);
    

    

  
     @override
     void initState() { 
       super.initState();
     }
  //  bool isheight = false;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
                      children:[ Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                          child: Image.asset("assets/images/background.jpeg",fit: BoxFit.cover,)),
              height: height/3,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                   // blurRadius: 40

                )]
              ),

            ),
            Positioned(
              top: height/3.5,
              right: width/3.8,
                          child: SizedBox(
                            height: height/10,
                            width: width/2,
                            child: Card(
                              color: Colors.white,
                              
                elevation: 3,
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("GET STARTED"),
                )),
              ),
                          ),
            )
                      ]
          ),

          SizedBox(
            height: height/5,
          ),

          SizedBox(
            height: height/15,
            width: width/1.2,
            child: ElevatedButton(
              
              style:

                ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.blue)
    )
  )
),
               
  
              
                
                
              
              onPressed: (){
                showModalBottomSheet(
                  context: context, builder: (context)
                  {
                   return  Container(
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.blue),
                         borderRadius: BorderRadius.circular(22)
                       ),
                       //color: Colors.red,
                       height: height/1,
                       width: width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height/20,
                            ),
                            Form(
                              key: _formkey,
                              child: bottomsheetview()),

                            FloatingActionButton(
                              

                              child: authprovider.loading ? CircularProgressIndicator(): Icon(Icons.arrow_right_alt, opticalSize: 20, ),
                              onPressed: (){

                                if(_formkey.currentState!.validate())
                                {
                                  authprovider.login(Name.phnno.text.toString(),context);

                                }

                                
                               
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>otpScreen()));

                            }),
                            
                          ],
                        ),
                      );
                  }
                  );


                
               }, child: Text("Login",style: TextStyle(color: Colors.black),)
                              ),
                          )
                
                
                        ],
                      ),
                      
                    );
                    
                  }


                }
 class Name {
  static var phnno = TextEditingController();
}

Widget bottomsheetview()
{
  
 return Padding(
   padding: const EdgeInsets.all(16.0),
   child: IntlPhoneField(
     validator: (value)
     {
       if(value == null || value.number.isEmpty)
       {
         return 'Enter Your Phone number';
       }
       return null;
     },
     controller: Name.phnno,
       initialCountryCode: 'IN',
       decoration: InputDecoration(
    labelText: "Phone Number",
    border: OutlineInputBorder(
      borderSide: BorderSide()
    )
       ),

     ),
   
 );
}


                
