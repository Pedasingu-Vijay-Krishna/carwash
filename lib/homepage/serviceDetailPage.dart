import 'package:carwash/SharePref/SharePref.dart';
import 'package:carwash/models/AddAddresssResponse.dart';

import 'package:carwash/router/RoteName.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/ApiProvider.dart';
import '../models/CarsByUserId.dart';
import '../models/CarsByUserId.dart' as cars;
import '../models/UserAddresssResponse.dart';
import '../models/UserAddresssResponse.dart' as address;
import '../utils/colors.dart';

class ServiceDetails extends StatefulWidget {


 final String servicename;
final  String id;


   ServiceDetails({super.key,required this.servicename,required this.id});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  UserAddresssResponse? getAddress;
  CarsByUserId? getUserCars;
  address.Result? _seelctedAddress;
  cars.Result? _seelctedCars;
  DateTime? selectedDate ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),title: Text(widget.servicename,style: TextStyle(color: Colors.white),),backgroundColor: ColorsList.black),

    body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  child: Container(width: size.width,child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Padding(
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
                  )),
                ),
              ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //
            //       Text("Weekly Once",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
            //       Text("     Dust Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //       Text("     External Body Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //       Text("     External Glass Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //       Text("     Bumper Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //       Text("     Tire Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //
            //     ],),
            // ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Interior Detailing",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
            ),
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  child: Container(width: size.width,child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Column(

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
                    ),
                  )),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Container(width: size.width,child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Monthly Twice",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                          Text("➢ Doors Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                          Text("➢ Wheel Arch Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                          Text("➢ Polishing",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
                          Text("   ✓ Dashboard",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                          Text("   ✓ Door Panels",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
                          Text("   ✓ Tires & Seat",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),

                        ],),
                    ),
                  )),
                ),
              ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //
            //       // Column(
            //       //
            //       //   mainAxisAlignment: MainAxisAlignment.start,
            //       //   crossAxisAlignment: CrossAxisAlignment.start,
            //       //   children: [
            //       //     Text("Monthly Once",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
            //       //     Text("➢ Car Shampoo External",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //       //     Text("➢ Interior Vacuum",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //       //     Text("➢  Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //       //     Text("     ✓ Seat Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
            //       //     Text("     ✓ Mat Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
            //       //     Text("     ✓ AC Vent Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
            //       //     Text("     ✓ Ash Tray Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
            //       //     Text("     ✓ Cup Holders Cleaning",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
            //       //
            //       //   ],),
            //
            //       SizedBox(height: 10,),
            //       Column(
            //
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //
            //           Text("➢ Doors Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //           Text("➢ Wheel Arch Cleaning",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //           Text("➢ Polishing",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500),),
            //           Text("   ✓ Dashboard",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
            //           Text("   ✓ Door Panels",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
            //           Text("   ✓ Tires & Seat",style: TextStyle(fontSize:12,fontWeight: FontWeight.w500),),
            //
            //         ],),
            //     ],),
            // ),

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
            Card(
              child: Container(
                width: size.width,
                child: Padding(
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
              ),
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
            Card(
              child: SizedBox(
                width: size.width,
                child: Padding(
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


                    ],),
                ),
              ),
            ),    SizedBox(height: 10,),
            Card(
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
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
                ),
              ),
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
            Card(
              child: SizedBox(
                width: size.width,
                child: Padding(
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
              ),
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
            Card(
              child: SizedBox(
                width: size.width,
                child: Padding(
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


                    ],),
                ),
              ),
            ),    SizedBox(height: 10,),
            Card(
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
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
                ),
              ),
            ),

          ],):SizedBox.shrink(),


          SizedBox(height: 25,),
           widget.servicename=="Standard"?Column(

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

           widget.servicename=="Premium" ? Column(

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

           widget.servicename=="Ultimate" ?Column(

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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            ElevatedButton(onPressed: (){

              showModalBottomSheet(context: context, builder: (BuildContext context){

                if(getUserCars==null ||getUserCars!.result!.isEmpty){
                  return Text("No Cars Added Please Add Cars");
                }else{
                  return ListView.builder(itemCount: getUserCars!.result!.length, itemBuilder: (BuildContext context, int index) {


                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(elevation: 3,child: ListTile(onTap: (){

                        _seelctedCars = getUserCars!.result!.elementAt(index);
                        context.pop();
                        setState(() {

                        });

                      },leading:ClipOval(child: Image.network(getUserCars!.result!.elementAt(index).company!.picture.toString(),    width: 50, // adjust the size as needed
                        height: 100, // adjust the size as needed
                        fit: BoxFit.cover,)) ,
                        title: Text(getUserCars!.result!.elementAt(index).name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),subtitle: Column(children: [


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Vechile Number"),
                              Text(getUserCars!.result!.elementAt(index).vehicleNumber.toString()),

                            ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Car Compnay"),
                              Text(getUserCars!.result!.elementAt(index).company!.company.toString()),

                            ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Car Color"),
                              Text(getUserCars!.result!.elementAt(index).color.toString()),

                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Car Type"),
                              Text(getUserCars!.result!.elementAt(index).model!.carModelType.toString()),

                            ],),   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Car Model"),
                              Text(getUserCars!.result!.elementAt(index).model!.carModel.toString()),

                            ],),



                        ]),

                      ),),
                    );

                  },);
                }


              });


            }, child: Text("SelectCar")),

            ElevatedButton(onPressed: (){

              showModalBottomSheet(context: context, builder: (BuildContext context){

                if(getAddress==null ||getAddress!.result!.isEmpty){
                  return Text("No Cars Added Please Add Address");
                }else{
                  return ListView.builder(itemCount: getAddress!.result!.length, itemBuilder: (BuildContext context, int index) {


                    return Card(child: ListTile(onTap: (){
                      _seelctedAddress = getAddress!.result!.elementAt(index);
                      setState(() {

                      });
                      context.pop();
                    },title:Text(getAddress!.result!.elementAt(index).name.toString()) ,subtitle: Text(getAddress!.result!.elementAt(index).address.toString()),trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),));


                  },);
                }


              });


            }, child: Text("Select Address")),

            ElevatedButton(onPressed: (){

              _selectDate(context);
            }, child: Text("StartDate")),

          ],),

          SizedBox(height: 15,),

     _seelctedCars!=null?     Card(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Selected Car",style: GoogleFonts.lato(fontSize: 18,color: Colors.indigo),),
                  ),
                  ListTile(title: Text(_seelctedCars!.company!.company.toString()),
                    subtitle: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween
                          ,children: [
                          Text("Number: ",style: GoogleFonts.lato(fontSize: 14,color: Colors.indigo)),
                          Text(_seelctedCars!.vehicleNumber.toString(),style: GoogleFonts.lato(fontSize: 14,color: Colors.indigo)),
                        ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween
                          ,children: [
                          Text("Color : "+_seelctedCars!.color.toString(),style: GoogleFonts.lato(fontSize: 14,color: Colors.indigo)) ,
                          Text(_seelctedCars!.color.toString(),style: GoogleFonts.lato(fontSize: 14,color: Colors.indigo))  ],
                        ),
                      ],
                    ),),


                ]),
          ),):SizedBox.shrink(),

          SizedBox(height: 10,),
         _seelctedAddress!=null? Card(child: Container(
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
                  ListTile(title: Text(_seelctedAddress!.name.toString()),subtitle: Text(_seelctedAddress!.address.toString(),style: GoogleFonts.lato(fontSize: 14,color: Colors.indigo)),),


                ]),
          ),):SizedBox.shrink(),
          SizedBox(height: 10,),
          selectedDate==null?SizedBox.shrink():Card(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text("Selected Date"),
              Text(selectedDate!.day.toString()+"-"+selectedDate!.month.toString()+"-"+selectedDate!.year.toString(),style: TextStyle(color: Colors.indigo),),


            ]),
          ),),
          ElevatedButton(onPressed: () async {


          await  SharePref().setSelectedCar(_seelctedCars!);
           await SharePref().setUserAddress(_seelctedAddress!);
         await   SharePref().setDate(selectedDate!);



            context.pushNamed(RouteNames.ServiceSummary);
         //   Get.to(()=>ServiceSummary());

          }, child: Text("Proceed")),
          SizedBox(height: 30,),
        ]),



    );
  }


  @override
  void initState() {

    getUserCar();
    getUserAddress();

    // TODO: implement initState
    super.initState();
  }

  getUserCar(){
    return  ApiProvider(context).getUserCars(SharePref().getUser()!.id.toString()).then((value){

       getUserCars = value;
       setState(() {

       });
      return value;
    });

  }

  getUserAddress(){

    return ApiProvider(context).getUserAddreess(SharePref().getUser()!.id.toString()).then((value) {


      getAddress = value;
      setState(() {

      });

    });

  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 60))
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
