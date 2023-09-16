import 'package:carwash/Services/ApiProvider.dart';
import 'package:carwash/SharePref/SharePref.dart';
import 'package:carwash/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/UserAddresssResponse.dart';
import '../../../router/RoteName.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({super.key});

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {

  Future<UserAddresssResponse>? getAddress;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,appBar: AppBar(automaticallyImplyLeading: true,title: Text("Address",style: TextStyle(color: Colors.black),),iconTheme: IconThemeData(color: Colors.black),backgroundColor: Colors.white,),

      body:ListView(children: [

        Align(alignment: Alignment.centerRight,child: GestureDetector(onTap: (){

          context.pushNamed(RouteNames.AddAddress).then((value) {
            getAddress = ApiProvider(context).getUserAddreess(SharePref().getUser()!.id.toString());
          });

        },child: Text(" + Add Address",style: TextStyle(color: Colors.black),)),),

        FutureBuilder(future: getAddress, builder: (BuildContext context, AsyncSnapshot<UserAddresssResponse> snapshot) {

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.connectionState == ConnectionState.done){

            if(snapshot.hasData){

              if(snapshot.data!.result!.isEmpty){
                return Center(child: Text("No AddressFound"),);
              }else{

                return ListView.builder(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),shrinkWrap: true,itemCount: snapshot.data!.result!.length, itemBuilder: (BuildContext context, int index) {

                  return Card(child: ListTile(title:Text(snapshot.data!.result!.elementAt(index).name.toString()) ,subtitle: Text(snapshot.data!.result!.elementAt(index).address.toString()),trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),));
                },);
              }


            }else{
              return Center(child: Text("No AddressFound"),);
            }
          }else{
            return Center(child: Text("No AddressFound"),);
          }

        },)
      ]) ,);
  }


  @override
  void initState() {
    getAddress = ApiProvider(context).getUserAddreess(SharePref().getUser()!.id.toString());
    // TODO: implement initState
    super.initState();
  }
}
