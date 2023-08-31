import 'package:carwash/Services/ApiProvider.dart';
import 'package:carwash/homepage/user/cars/add_cars.dart';
import 'package:carwash/models/CarsmodelsResponse.dart';
import 'package:carwash/router/RoteName.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../models/AddUserCarResponse.dart';
import '../../../models/CarsByUserId.dart';
class Carslist extends StatefulWidget {
  const Carslist({super.key});

  @override
  State<Carslist> createState() => _CarslistState();
}

class _CarslistState extends State<Carslist> {

late  Future<CarsByUserId> getUserCars;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(appBar: AppBar(title: Text("Cars List"),),

      body: ListView(children: [

        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: TextButton(onPressed: () {

                  context.pushNamed(RouteNames.Addcars).then((value) {
                    getUserCars =  getUserCar();

                  });
               //   Get.to(() => Addcars());

                }, child: Text("Add Car +"))),
          ),
        ),

       FutureBuilder(future: getUserCars, builder: (BuildContext context, AsyncSnapshot<CarsByUserId> snapshot) {


       if(snapshot.connectionState == ConnectionState.done){
         if(snapshot.data!.result!.isEmpty){

           return ListTile(title:Text("No Cars Added") ,);
         }
         else{


           return ListView.builder(shrinkWrap: true,itemCount:snapshot.data!.result!.length, itemBuilder: (BuildContext context, int index) {

             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(elevation: 3,child: ListTile(leading:ClipOval(child: Image.network("https://corgi-humane-completely.ngrok-free.app/api/v1/"+snapshot.data!.result!.elementAt(index).company!.picture.toString(),    width: 50, // adjust the size as needed
                 height: 100, // adjust the size as needed
                 fit: BoxFit.cover,)) ,
               title: Text(snapshot.data!.result!.elementAt(index).name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),subtitle: Column(children: [


                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                   Text("Vechile Number"),
                   Text(snapshot.data!.result!.elementAt(index).vehicleNumber.toString()),

                 ],),

                   Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                   Text("Car Compnay"),
                   Text(snapshot.data!.result!.elementAt(index).company!.company.toString()),

                 ],),

                   Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                   Text("Car Color"),
                   Text(snapshot.data!.result!.elementAt(index).color.toString()),

                 ],),
                   Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                   Text("Car Type"),
                   Text(snapshot.data!.result!.elementAt(index).model!.carModelType.toString()),

                 ],),   Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                   Text("Car Model"),
                   Text(snapshot.data!.result!.elementAt(index).model!.carModel.toString()),

                 ],),



                 ]),

               ),),
             );

           } ,);
         }
       }else if(snapshot.connectionState == ConnectionState.waiting){
         return Center(child: CircularProgressIndicator());
       }else{
         return Center(child: CircularProgressIndicator());
       }
       //  return ListView.builder(itemCount: snapshot.data.,);


       }, ),


      ]),);
  }


  @override
  void initState() {
    // TODO: implement initState
    //  loadJsonData();

    getUserCars =  getUserCar();
    super.initState();
  }

Future<CarsByUserId>  getUserCar(){
    final box = GetSecureStorage();
    var useird =box.read("user");
    debugPrint(useird['_id'].toString());
   return  ApiProvider(context).getUserCars(useird['_id'].toString()).then((value){

     return value;
    });
  }

}
