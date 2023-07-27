import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mero_futter/ui/instagram.dart';
import './signup.dart';
import 'newui/instagram.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black ,
      body:Container(
        width:double.infinity,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FlutterLogo(size:200.00,style:FlutterLogoStyle.stacked),
            Image.asset('assets/instagram.png',height: 100,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              // ElevatedButton(onPressed: (){}, child:Text('Sign Up')),
              // SizedBox(width: 20,),
              //   ElevatedButton(onPressed: (){}, child:Text('Login'))
              InkWell(

                onTap:(){
                  print("Signup Clicked");

                  Navigator.push(context,MaterialPageRoute(builder: (context){
                        return InstagramHomePage();
                  }));
                },
                child: Container(
                  padding: EdgeInsets.only(top:10,bottom: 10,right: 20,left: 20),
                  // color:Colors.white,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text('Sign Up',style:TextStyle(fontSize: 18)),
                ),
              ),

              SizedBox(width: 10,),

               InkWell(

                onTap:(){
                  print("Login Clicked");

                  // Navigator.push(context,MaterialPageRoute(builder: (context){
                  //       return InstaHome();
                  // }));
                  // using arrow function
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>InstaHome()));
                },
                child: Container(
                  padding: EdgeInsets.only(top:9,bottom: 9,right: 19,left: 19),
                  // color:Colors.white,
                  decoration: BoxDecoration(
                    // color:Colors.black,
                    border: Border.all(color:Colors.white,width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text('Log In',style:TextStyle(color:Colors.white,fontSize: 18, )),
                ),
              )



            ],),
            SizedBox(height: 100,),
            Text('OR',style:TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
            Text('Login with Social',style:TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w300)),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/google.png",height: 40,),
                  SizedBox(width: 20,),
                  Image.asset('assets/facebook.png',height: 40,),
                // IconButton(onPressed: (){}, icon: Icon(Icons.camera_sharp,color: Colors.white,))
              ],),
            ),
            

          ],
      
        ),
      ),
    );
  }
}