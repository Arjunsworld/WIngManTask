import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:wm_task/Design/get_Started.dart';
import 'package:wm_task/Design/profie.dart';
import 'package:wm_task/provider/authProvider.dart';


class otpScreen extends StatefulWidget {
  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {

  String? otp;
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<Auth_Provider>(context);
    var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Verify Details: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              )),
            
            height: height/3.5,
            width: width,

            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                )
              ]
            ),

          ),
          SizedBox(
            height: height/20,
          ),
          Text("Otp has been sent to ${Name.phnno.text}"),
          OtpTextField(
            numberOfFields: 6,
            borderColor: Colors.black,
            focusedBorderColor: Colors.blue,
            showFieldAsBox: true,
            onCodeChanged: (String code){
                 
                  setState(() {
                     otp = code;
                  });
            },
            onSubmit: (String verificationcode){

                //Otp verifivation
                        authprovider.Verify(Name.phnno.text.toString(), '123456',context);


              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text("Verification Code"),
                  content: Text("Code entered is $otp"),
                );
              });

                    
             
            },
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1,
              
            ),
          ),
          //ElevatedButton(onPressed: (){}, child: Text("Verify")),
          InkWell(
            onTap: (){
               Navigator.pop(context);
            },
            child: Text("Didn't recieve code? retry.",style: TextStyle(color: Colors.blue),))

        ],
      ),
      
      
    );
  }
}