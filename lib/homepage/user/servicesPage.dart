import 'package:carwash/homepage/serviceDetailPage.dart';
import 'package:carwash/homepage/user/service_summary.dart';
import 'package:carwash/router/RoteName.dart';
import 'package:carwash/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  String? ServiceType;
  bool daily = false;
  bool alter = false;
  bool weekly = false;
  DateTime? _selectedDate;
  DateTime selectTime = DateTime.now();
  List<String> timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
  ];

  String? selectedTimeSlot;

  final List<String> service_images_names = [

    'Standard',
    'Premium',
    'Ultimate',
  ];
  final List<String> service_images = [

    'assets/services_images/standard.jpg',
    'assets/services_images/premium.jpg',
    'assets/services_images/ultimate.jpg',
  ];



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),title: Text("Car Wash Services",style: TextStyle(color: Colors.white),),backgroundColor: ColorsList.black),

      body: ListView.builder(shrinkWrap: true,itemCount: service_images.length,itemBuilder: (BuildContext context, int index) {

        return GestureDetector(
          onTap: (){

            context.pushNamed(RouteNames.serviceDetails,queryParameters: {"servicename": service_images_names.elementAt(index),"id": index.toString()});
          // ServiceDetails(servicename: service_images_names.elementAt(index), id: index.toString());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(elevation: 5.0,child: Container(width: size.width*0.8,height: size.height*0.25,decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(service_images.elementAt(index)),fit: BoxFit.fill)
            ),child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(service_images_names.elementAt(index),style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold)),
            )),),
          ),
        );



      },),

    );
  }



// @override
// Widget build(BuildContext context) {
//   return  Scaffold(appBar: AppBar(title: Text('Services',style: GoogleFonts.lato(color: Colors.indigo,fontWeight: FontWeight.bold),),),body: ListView(children: [
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//
//               Text("Select Serivces  Activity Type",style: GoogleFonts.lato(fontSize: 15,color: Colors.indigo),),
//               Text("Select date",style: GoogleFonts.lato(fontSize: 15,color: Colors.indigo)),
//
//             ]),
//       ),),
//     ),
//
//
//     // SizedBox(
//     //
//     //   height: 150,
//     //   child: ListView.builder(
//     //     itemCount: timeSlots.length,
//     //     itemBuilder: (context, index) {
//     //       final timeSlot = timeSlots[index];
//     //       final isSelected = timeSlot == selectedTimeSlot;
//     //       return GestureDetector(
//     //         onTap: () {
//     //           setState(() {
//     //             selectedTimeSlot = timeSlot;
//     //           });
//     //         },
//     //         child: Container(
//     //           color: isSelected ? Colors.blue : null,
//     //           padding: EdgeInsets.all(16.0),
//     //           child: Text(
//     //             timeSlot,
//     //             style: TextStyle(
//     //               color: isSelected ? Colors.white : null,
//     //               fontWeight: isSelected ? FontWeight.bold : null,
//     //             ),
//     //           ),
//     //         ),
//     //       );
//     //     },
//     //   ),
//     // ),
//     Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             width: Get.width
//             ,child: DropdownButton<String>(
//               isExpanded: true,
//               value: ServiceType,
//               style: TextStyle(color: Colors.indigo,fontSize: 20),
//               hint: Text('Please Seelct Activity Type'),
//               items: <String>['Daily Activity', 'Alternative Activity', 'Weekly Activity'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (valu) {
//
//                 if(valu =='Daily Activity'){
//
//                   daily = true;
//                   alter = false;
//                   weekly = false;
//
//                 }else if( valu == 'Alternative Activity'){
//                   daily = false;
//                   alter = true;
//                   weekly = false;
//                 }
//                 else{
//
//                   daily = false;
//                   alter = false;
//                   weekly = true;
//
//                 }
//                 ServiceType = valu;
//                 setState(() {
//
//                 });
//               },
//             ),
//           ),
//           Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   _selectedDate == null
//                       ? 'No date selected'
//                       : 'Selected Date : ${_selectedDate!.day.toString()+' / '+_selectedDate!.month.toString()+" / "+_selectedDate!.year.toString()}     ',
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     _selectDate(context);
//                   },
//                   child: Text('Select Date'),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//
//   Visibility(visible: daily,child: Column(children: [
//
//
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(color: Colors.white,elevation: 10,child: Center(
//         child: SizedBox(
//           width: Get.width*0.9,
//           child: Row(
//             children: [
//               RotatedBox(
//                 quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                 child: Center(child: Text("Weekly 5 Days",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//               ),
//               SizedBox(width: 5,),
//               Column(
//
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10,),
//                     Text("➢  Dust Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢  External Body Cleaning ",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢  External Glass Cleaning ",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢  Bumper Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢  Tire Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                   ]),
//             ],
//           ),
//         ),
//       ),),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(elevation: 10,child: Center(
//         child: SizedBox(
//           width: Get.width*0.9,
//           child: Row(
//             children: [
//               RotatedBox(
//                 quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                 child: Center(child: Text("Weekly Once",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//               ),
//               SizedBox(width: 5,),
//               Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10,),
//                     Text("➢ Car Shampoo External",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Seat Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Mat Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ AC Vent Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Ash Tray Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Doors Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Wheel Arch Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//
//                   ]),
//             ],
//           ),
//         ),
//       ),),
//     ),
//
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(elevation: 10,child: Center(
//         child: SizedBox(
//           width: Get.width*0.9,
//           child: Row(
//             children: [
//               RotatedBox(
//                 quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                 child: Center(child: Text("Monthly Twice",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//               ),
//               SizedBox(width: 5,),
//               Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20,),
//                     Text("➢ Dashboard Polishing ",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Door Panels Polishing ",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Tire Polishing",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Seat Polishing",style: GoogleFonts.lato(fontSize: 18),),
//                     const SizedBox(height: 20,),
//                   ]),
//             ],
//           ),
//         ),
//       ),),
//     ),
//   ],)),
// Visibility(visible: alter,child: Column(children: [
//
//
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(elevation: 10,child: Center(
//         child: SizedBox(
//           width: Get.width*0.9,
//           child: Row(
//             children: [
//               RotatedBox(
//                 quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                 child: Center(child: Text("Weekly 2 Days",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//               ),
//               SizedBox(width: 5,),
//               Column(
//
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10,),
//                     Text("➢  Dust Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢  External Body Cleaning ",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢  External Glass Cleaning ",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢  Bumper Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢  Tire Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                   ]),
//             ],
//           ),
//         ),
//       ),),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(elevation: 10,child: Center(
//         child: SizedBox(
//           width: Get.width*0.9,
//           child: Row(
//             children: [
//               RotatedBox(
//                 quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                 child: Center(child: Text("Weekly Once",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//               ),
//               SizedBox(width: 5,),
//               Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10,),
//                     Text("➢ Car Shampoo External",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Seat Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Mat Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ AC Vent Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Ash Tray Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Doors Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Wheel Arch Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//
//                   ]),
//             ],
//           ),
//         ),
//       ),),
//     ),
//
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(elevation: 10,child: Center(
//         child: SizedBox(
//           width: Get.width*0.9,
//           child: Row(
//             children: [
//               RotatedBox(
//                 quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                 child: Center(child: Text("Monthly Twice",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//               ),
//               SizedBox(width: 5,),
//               Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20,),
//                     Text("➢ Dashboard Polishing ",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Door Panels Polishing ",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Tire Polishing",style: GoogleFonts.lato(fontSize: 18),),
//                     Text("➢ Seat Polishing",style: GoogleFonts.lato(fontSize: 18),),
//                     const SizedBox(height: 20,),
//                   ]),
//             ],
//           ),
//         ),
//       ),),
//     ),
//   ],)),
//
//
//     Visibility(visible: weekly,child: Column(children: [
//
//
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(elevation: 10,child: Center(
//           child: SizedBox(
//             width: Get.width*0.9,
//             child: Row(
//               children: [
//                 RotatedBox(
//                   quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                   child: Center(child: Text("Weekly Once",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//                 ),
//                 SizedBox(width: 5,),
//                 Column(
//
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 10,),
//                       Text("➢  Dust Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢  External Body Cleaning ",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢  External Glass Cleaning ",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢  Bumper Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢  Tire Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                     ]),
//               ],
//             ),
//           ),
//         ),),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(elevation: 10,child: Center(
//           child: SizedBox(
//             width: Get.width*0.9,
//             child: Row(
//               children: [
//                 RotatedBox(
//                   quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                   child: Center(child: Text("Weekly Once",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//                 ),
//                 SizedBox(width: 5,),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 10,),
//                       Text("➢ Car Shampoo External",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ Seat Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ Mat Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ AC Vent Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ Ash Tray Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ Doors Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ Wheel Arch Cleaning",style: GoogleFonts.lato(fontSize: 18),),
//
//                     ]),
//               ],
//             ),
//           ),
//         ),),
//       ),
//
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(elevation: 10,child: Center(
//           child: SizedBox(
//             width: Get.width*0.9,
//             child: Row(
//               children: [
//                 RotatedBox(
//                   quarterTurns: 3, // Rotate the child 270 degrees clockwise
//                   child: Center(child: Text("Weekly Once",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo))),
//
//                 ),
//                 SizedBox(width: 5,),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 20,),
//                       Text("➢ Dashboard Polishing ",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ Door Panels Polishing ",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ Tire Polishing",style: GoogleFonts.lato(fontSize: 18),),
//                       Text("➢ Seat Polishing",style: GoogleFonts.lato(fontSize: 18),),
//                       const SizedBox(height: 20,),
//                     ]),
//               ],
//             ),
//           ),
//         ),),
//       ),
//     ],)),
//
//
//     Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
//       child: ElevatedButton(onPressed: (){
//
//         Get.to(() => ServiceSummary());
//
//       }, child: Text("Book Appointment")),
//     )
//
//
//   ]),);
// }


}
