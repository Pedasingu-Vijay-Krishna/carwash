import 'package:carwash/Services/ApiProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/SubscriptionResponse.dart';

class DeatilsSubscrition extends StatefulWidget {
  const DeatilsSubscrition({super.key});

  @override
  State<DeatilsSubscrition> createState() => _DeatilsSubscritionState();
}

class _DeatilsSubscritionState extends State<DeatilsSubscrition> {

  Future<SubscriptionResponse>? getSbuscritions;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text("My Subscriptions")),

    body: FutureBuilder(future: getSbuscritions, builder: (BuildContext context, AsyncSnapshot<SubscriptionResponse> snapshot) {


      if(snapshot.connectionState== ConnectionState.done){
        return  ListView.builder(itemCount: snapshot.data!.subscriptionresult.length,itemBuilder: (context,index){


          return  snapshot.data!.subscriptionresult.elementAt(index).isActive?  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(color: Colors.indigo.shade50,child: Container(

              child: Column(
                children: [
                  ListTile(title: Text(snapshot.data!.subscriptionresult.elementAt(index).name,style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold),),
                      subtitle: Text(snapshot.data!.subscriptionresult.elementAt(index).descrition)),
                  ListTile(title: Text("Days : "+snapshot.data!.subscriptionresult.elementAt(index).days.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.bold),),
                      subtitle: Text("Amount "+snapshot.data!.subscriptionresult.elementAt(index).amount.toString())),
                  // ListTile(title: Text("Cancel Subscription",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                  //     trailing: Text("Upgrade Plan >",style: GoogleFonts.lato(color: Colors.indigo,fontSize: 15,fontWeight: FontWeight.bold),)),

                ],
              ),

            ),),
          ):SizedBox.shrink();

        },);
      }else{
        return Center(child: CircularProgressIndicator(),);
      }

    },)

    );
  }


  @override
  void initState() {

    getSbuscritions = ApiProvider(context).getSubscriptions();
    // TODO: implement initState
    super.initState();
  }
}
