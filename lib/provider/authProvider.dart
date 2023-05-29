import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:wm_task/Design/homepage.dart';
import 'package:wm_task/Design/otp_Screen.dart';
import 'package:wm_task/Design/profie.dart';


class Auth_Provider with ChangeNotifier
{
bool _loading = false;
GlobalKey<FormState> _formkey = GlobalKey<FormState>();


GlobalKey<FormState> get formkey => _formkey;

setkey(GlobalKey<FormState> key)
{

_formkey = key;
  notifyListeners();


}


bool get loading => _loading;

setloading(bool value)
{
  _loading = value;
  notifyListeners();
}



Verify(String request_id,String code,BuildContext context) async
{
try{
  var url = "https://test-otp-api.7474224.xyz/verifyotp.php";

  Response response = await post(Uri.parse(url),
  body: {"request_id": request_id,"code": code});

  if(response.statusCode == 200)
  {
    print("Success");
    log(response.body);

     Navigator.push(context, MaterialPageRoute(builder: (context){
               return Profile();
              }));

  }
  else
  {
    print("Falied");
  }


}
catch(e)
{
  print(e.toString());

}

}


Submit(String name,String email,BuildContext context) async
{
  setloading(true);
  try
  {
    Response response = await post(Uri.parse('https://test-otp-api.7474224.xyz/profilesubmit.php'),
    headers: {
      "Token": "jwt1235"
    },
    body: {
      "name" : name,
      "email" : email,

    }
    );

    if(response.statusCode == 200 || formkey.currentState!.validate())
    {
      setloading(false);
      log("Submitted");
      print(response.body);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage() )  );
    }
    else
    {
      log(" error not submitted");
    }

  }
  catch(e)
  {
    print(e.toString());

  }
}







login(String phno,BuildContext context) async
{
  setloading(true);
  try
  {
       Response response = await post(Uri.parse('https://test-otp-api.7474224.xyz/sendotp.php?'),
       body: {
         'mobile' : phno
       }
       );

       if(response.statusCode == 200 || formkey.currentState!.validate())
       {
         print("Sent");
         setloading(false);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> otpScreen() ));
       }
       else
       {
         print("Failed");
       }

       
  }
  catch(e)
  {
     print(e.toString());
  }
}


}