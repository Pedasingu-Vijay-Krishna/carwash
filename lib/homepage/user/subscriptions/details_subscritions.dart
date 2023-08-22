import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DeatilsSubscrition extends StatefulWidget {
  const DeatilsSubscrition({super.key});

  @override
  State<DeatilsSubscrition> createState() => _DeatilsSubscritionState();
}

class _DeatilsSubscritionState extends State<DeatilsSubscrition> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text("My Subscriptions")),

    body: ListView(children: [

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(color: Colors.indigo.shade50,child: Container(width: Get.width*0.5,
        child: Column(
          children: [
            ListTile(title: Text("Yearly Subscription",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold),),
                    subtitle: Text("It will be valid for One Year .....")),
               ListTile(title: Text("Next Billing Date : 12th April 2023",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),),
                    subtitle: Text("It will be valid for One Year .....")),
    ListTile(title: Text("Cancel Subscription",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                    trailing: Text("Upgrade Plan >",style: GoogleFonts.lato(color: Colors.indigo,fontSize: 15,fontWeight: FontWeight.bold),)),

          ],
        ),

        ),),
      )


    ]),

    );
  }
}
