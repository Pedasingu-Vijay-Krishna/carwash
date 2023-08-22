import 'package:carwash/homepage/user/useehomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
class ServiceSummary extends StatefulWidget {
  const ServiceSummary({super.key});

  @override
  State<ServiceSummary> createState() => _ServiceSummaryState();
}

class _ServiceSummaryState extends State<ServiceSummary> {

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return  Scaffold(

      appBar: AppBar(title: Text("Summary"),),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [

          Card(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Selected Service",style: GoogleFonts.lato(fontSize: 18,color: Colors.indigo),),
            ),
            ListTile(title: Text("Weekly Service"),subtitle: Text("Service will be based on selected package"),),

                ListTile(title: Text("Service Start Date"),trailing: Text("20th May 2023",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.indigo)),)

          ]),
          ),),

          SizedBox(height: 10,),
          Card(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Select Car",style: GoogleFonts.lato(fontSize: 18,color: Colors.indigo),),
            ),
            ListTile(title: Text("Mahindra Xuv"),trailing: Text("Color : White",style: GoogleFonts.lato(fontSize: 14,color: Colors.indigo)),subtitle: Text("Number: AP39AS4747",style: GoogleFonts.lato(fontSize: 14,color: Colors.indigo)),),


          ]),
          ),),

          SizedBox(height: 10,),
          Card(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Select Address",style: GoogleFonts.lato(fontSize: 18,color: Colors.indigo),),
            ),
            ListTile(title: Text("Home"),subtitle: Text("Home Address , Hyderabd , Home Address , Hyderabd , Kudkatpally,Kudkatpally Home Address , Hyderabd , Kudkatpally",style: GoogleFonts.lato(fontSize: 14,color: Colors.indigo)),),


          ]),
          ),),

          SizedBox(height: 10,),
          Card(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Payment Summary",style: GoogleFonts.lato(fontSize: 18,color: Colors.indigo),),
            ),
            ListTile(
              subtitle: Column(children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Service Cost"),
                  Text("450"),


                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Gst "),
                  Text("50"),


                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Total "),
                  Text("450"),


                ],),
                SizedBox(height: 10,),


              ],)),


          ]),
          ),),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text("Terms and Conditions"),
          ),  Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 5),
            child: Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'I Agree ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'And ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'T&C*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: ElevatedButton(onPressed: (){

              Get.to(() => UserHome());

            }, child: Text("Payment")),
          )



        ]),
      ),


    );
  }
}
