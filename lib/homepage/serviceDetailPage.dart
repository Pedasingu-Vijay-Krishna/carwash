import 'package:carwash/homepage/user/service_summary.dart';
import 'package:carwash/homepage/user/servicesPage.dart';
import 'package:carwash/router/RoteName.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../utils/colors.dart';

class ServiceDetails extends StatefulWidget {


 final String servicename;
final  String id;


   ServiceDetails({super.key,required this.servicename,required this.id});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),title: Text(widget.servicename,style: TextStyle(color: Colors.white),),backgroundColor: ColorsList.black),

    body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        children: [

          SizedBox(height: 15,),
          Center(child: Text("The "+widget.servicename+" Pack",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),
          widget.servicename=="Standard"?Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 25),
                child: Text("Experience an entry-level detail service that will leave your car shining both inside and out!",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(CupertinoIcons.clock,size:25,color: Colors.grey,),
                Text(" From 30min to 45 minutes",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.grey),),


              ],),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: Text("A convenient combination of weekly exterior cleaning and monthly interior cleaning with a focus on polishing for a complete and polished car care experience.",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Center(child: Text("What's in the Standard Service package?",textAlign: TextAlign.center,style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)),
              // child: Center(child: Text("What's in the Platinum Car Wash package?",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Exterior Detailing",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 5,
                child: Container(color: Colors.grey.shade100,child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(child: Image.asset("assets/serives_cursol/shampoo Cleaning.jpg"),),
                )),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Weekly Once",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                  Text("     Dust Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("     External Body Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("     External Glass Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("     Bumper Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("     Tire Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),

                ],),
            ),
            SizedBox(height: 25,),
            Text("Interior Detailing",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
        //    SizedBox(width: size.width/2.5,child: Image.asset("assets/serives_cursol/Seat Cleaning.jpg",fit: BoxFit.fill),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  child: Container(color: Colors.grey.shade100,child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(child: Image.asset("assets/serives_cursol/Seat Cleaning.jpg"),),
                  )),
                ),
              ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Monthly Once",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                      Text("➢ Car Shampoo External",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Interior Vacuum",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢  Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("     ✓ Seat Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Mat Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ AC Vent Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Ash Tray Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Cup Holders Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),

                    ],),

                  SizedBox(height: 10,),
                  Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("➢ Doors Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Wheel Arch Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Polishing",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("   ✓ Dashboard",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("   ✓ Door Panels",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("   ✓ Tires & Seat",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),

                    ],),
                ],),
            ),

          ],):SizedBox.shrink(),
       widget.servicename=="Premium"?Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 25),
                child: Text("Experience the ultimate choice for a comprehensive cleaning of your car's exterior and interior.",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(CupertinoIcons.clock,size:25,color: Colors.grey,),
                Text(" From 30min to 45 minutes",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.grey),),


              ],),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: Text("Never worry about maintaining your car again with our convenient at-home service! Enjoy a meticulous hand wash, both inside and out, to keep your car looking its best. Say goodbye to dull tires and hello to a shining, showroom-worthy finish.",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Center(child: Text("What's in the "+widget.servicename+" Service package?",textAlign: TextAlign.center,style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)),
              // child: Center(child: Text("What's in the Platinum Car Wash package?",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Exterior Detailing",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 5,
                child: Container(color: Colors.grey.shade100,child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(child: Image.asset("assets/serives_cursol/car-wash-detailing-station.jpg"),),
                )),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Weekly 5 Days",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                  Text("    ➢ Dust Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("    ➢ External Body Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("    ➢ External Glass Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("    ➢ Bumper Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("    ➢ Tire Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),

                ],),
            ),
            SizedBox(height: 25,),
            Text("Interior Detailing",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
        //    SizedBox(width: size.width/2.5,child: Image.asset("assets/serives_cursol/Seat Cleaning.jpg",fit: BoxFit.fill),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  child: Container(color: Colors.grey.shade100,child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(child: Image.asset("assets/serives_cursol/AC vents cleaning.jpg"),),
                  )),
                ),
              ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Monthly Twice",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                      Text("➢ Car Shampoo External",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Interior Vacuum",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢  Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("     ✓ Seat Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Mat Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ AC Vent Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Ash Tray Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Cup Holders Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("➢ Doors Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Wheel Arch Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),

                    ],),

                  SizedBox(height: 10,),
                  Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Monthly Once",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),

                      Text("➢ Dashboard Polishing",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Door Panels Polishing",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("➢ Tires Polishing",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("➢ Seat Polishing",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),

                    ],),
                ],),
            ),

          ],):SizedBox.shrink(),
       widget.servicename=="Ultimate"?Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 25),
                child: Text("Experience the convenience of doorstep service with our polishing, shampooing, and sanitizing solutions. Simply click to book and enjoy a professional car care experience at your convenience.",textAlign: TextAlign.center,style: TextStyle(fontSize: 25
                    ,fontWeight: FontWeight.bold),),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(CupertinoIcons.clock,size:25,color: Colors.grey,),
                Text(" From 30min to 45 minutes",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.grey),),


              ],),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: Text("This package is designed for customers who strive to keep their car in expectational condition! Your Car will Thank You After!",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Center(child: Text("What's in the "+widget.servicename+" Service package?",textAlign: TextAlign.center,style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)),
              // child: Center(child: Text("What's in the Platinum Car Wash package?",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Exterior Detailing",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 5,
                child: Container(color: Colors.grey.shade100,child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(child: Image.asset("assets/serives_cursol/car-wash-detailing-station.jpg"),),
                )),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Weekly 5 Days",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                  Text("    ➢ Dust Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("    ➢ External Body Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("    ➢ External Glass Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("    ➢ Bumper Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                  Text("    ➢ Tire Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),

                ],),
            ),
            SizedBox(height: 25,),
            Text("Interior Detailing",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
        //    SizedBox(width: size.width/2.5,child: Image.asset("assets/serives_cursol/Seat Cleaning.jpg",fit: BoxFit.fill),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  child: Container(color: Colors.grey.shade100,child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(child: Image.asset("assets/serives_cursol/AC vents cleaning.jpg"),),
                  )),
                ),
              ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Monthly Once",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                      Text("➢ Car Shampoo External",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Interior Vacuum",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢  Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("     ✓ Seat Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Mat Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ AC Vent Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Ash Tray Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("     ✓ Cup Holders Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("➢ Doors Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Wheel Arch Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),

                    ],),

                  SizedBox(height: 10,),
                  Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Monthly Twice",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),

                      Text("➢ Dashboard Polishing",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                      Text("➢ Door Panels Polishing",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("➢ Tires Polishing",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                      Text("➢ Seat Polishing",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),

                    ],),
                ],),
            ),

          ],):SizedBox.shrink(),


          SizedBox(height: 25,),
          /* widget.servicename=="Standard"*/true?Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Standard Package-FAQs",style: TextStyle(fontSize: 20),),
              ExpansionTileCard(title: Text("Q. How long does it take to do the ultimate Package?",style: TextStyle(color: Colors.red)),
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("A. We Spend approximately 30-45mins for interior and polishing Overall we allot 180mins in a month for cleaning and make your car shine like a pro."),
                  ),

                ],
              ),


            ],):SizedBox.shrink(),

          /*  widget.servicename=="Standard"*/ true? Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Premium Package-FAQs",style: TextStyle(fontSize: 20),),
              ExpansionTileCard(title: Text("Q. What is the difference with the Standard wash?",style: TextStyle(color: Colors.red)),
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("A.Standard Package: Keep your car looking its best with our weekly wet wash for the exterior and monthly interior cleaning and polishing.Premium Package: Elevate your car care routine with our premium package, offering a wet wash for the exterior five days a week and monthly interior cleaning. Additionally, we provide monthly polishing to enhance the overall shine and appearance of your car."),
                  ),

                ],
              ),
              ExpansionTileCard(title: Text("Q. How long does it take to do the ultimate Package?",style: TextStyle(color: Colors.red)),
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("A. We Spend approximately \n 1. 10-15mins for daily Cleaning and  \n 2. 30-45mins for interior and polishingOverall we allot 440mins in a month for cleaning and make your car shine like a pro."),
                  ),

                ],
              ),


            ],):SizedBox.shrink(),

          /* widget.servicename=="Standard"*/ true?Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

           Text("Ultimate Package-FAQs",style: TextStyle(fontSize: 20),),
              ExpansionTileCard(title: Text("Q. What is the difference with the premium wash?",style: TextStyle(color: Colors.red)),
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("A. 1. The clay treatment smooths out the imperfections of the paint which are often caused by build up dirt, grime and pollution.2. plastic dressing will be applied both to inside and exterior of the car for the final finishing touch plastic dressing is one of the most requested finishing touches- it will make your car even shiner!"),
                ),

              ],
              ),
              ExpansionTileCard(title: Text("Q. What is the expected out come of the ultimate package?",style: TextStyle(color: Colors.red)),
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("A. The ultimate package is about restoring your car to its best possible. Our detailers treat your paint, correct minor imperfections and make it shiny and smooth like glass on top of getting your interior fully cleaned and sanitized. That’s perfect package if you care about the look and condition of your vehicle or if you plan to sell your car"),
                  ),

                ],
              ),
              ExpansionTileCard(title: Text("Q. How long does it take to do the ultimate Package?",style: TextStyle(color: Colors.red)),
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("A. We Spend approximately1. 10-15mins for daily Cleaning and2. 30-45mins for interior and polishingOverall we allot 580mins in a month for cleaning and make your car shine like a pro."),
                  ),

                ],
              )

            ],):SizedBox.shrink(),

          Row(children: [

            ElevatedButton(onPressed: (){

            }, child: Text("Select Car")),
            SizedBox(width: 5,),
            ElevatedButton(onPressed: (){

            }, child: Text("Select Address")),
            SizedBox(width: 5,),
            ElevatedButton(onPressed: (){

            }, child: Text("Start Date")),

          ],),

          SizedBox(height: 15,),

          ElevatedButton(onPressed: (){


            context.pushNamed(RouteNames.ServiceSummary);
         //   Get.to(()=>ServiceSummary());

          }, child: Text("Proceed")),
          SizedBox(height: 30,),
        ]),



    );
  }
}
