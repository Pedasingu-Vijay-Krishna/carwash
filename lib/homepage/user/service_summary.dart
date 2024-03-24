import 'package:carwash/Services/ApiProvider.dart';
import 'package:carwash/homepage/user/useehomePage.dart';
import 'package:carwash/models/UserBookingRequest.dart';
import 'package:carwash/models/UsersubscriptionAddRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/CarsByUserId.dart' as cars;

import '../../models/UserAddresssResponse.dart' as address;
import '../../SharePref/SharePref.dart';
import '../../models/UsersubscriptionbydateResponse.dart';
import '../../router/RoteName.dart';

class ServiceSummary extends StatefulWidget {
  ServiceSummary({
    super.key,
  });

  @override
  State<ServiceSummary> createState() => _ServiceSummaryState();
}

class _ServiceSummaryState extends State<ServiceSummary> {
  address.Result? _seelctedAddress;
  cars.Result? _seelctedCars;
  UsersubscriptionbydateResponse? usersubscriptionbydateResponse;
  DateTime? selectedDate;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Selected Service",
                        style: GoogleFonts.lato(
                            fontSize: 18, color: Colors.indigo),
                      ),
                    ),
                    ListTile(
                      title: Text("Weekly Service"),
                      subtitle:
                          Text("Service will be based on selected package"),
                    ),
                    ListTile(
                      title: Text("Service Start Date"),
                      trailing: Text(
                          selectedDate!.day.toString() +
                              "-" +
                              selectedDate!.month.toString() +
                              "-" +
                              selectedDate!.year.toString(),
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo)),
                    )
                  ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Selected Car",
                        style: GoogleFonts.lato(
                            fontSize: 18, color: Colors.indigo),
                      ),
                    ),
                    ListTile(
                      title: Text(_seelctedCars!.company!.company.toString()),
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Number: ",
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.indigo)),
                              Text(_seelctedCars!.vehicleNumber.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.indigo)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Color : " + _seelctedCars!.color.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.indigo)),
                              Text(_seelctedCars!.color.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.indigo))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Select Address",
                        style: GoogleFonts.lato(
                            fontSize: 18, color: Colors.indigo),
                      ),
                    ),
                    ListTile(
                      title: Text(_seelctedAddress!.name.toString()),
                      subtitle: Text(_seelctedAddress!.address.toString(),
                          style: GoogleFonts.lato(
                              fontSize: 14, color: Colors.indigo)),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          usersubscriptionbydateResponse == null
              ? SizedBox(
                  height: 10,
                )
              : usersubscriptionbydateResponse!.usersubscriptionresult == null
                  ? Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: size.width,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Select Subscription",
                                  style: GoogleFonts.lato(
                                      fontSize: 18, color: Colors.indigo),
                                ),
                              ),
                              ListTile(
                                title: Text(_seelctedAddress!.name.toString()),
                                subtitle: Text(
                                    _seelctedAddress!.address.toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 14, color: Colors.indigo)),
                              ),
                            ]),
                      ),
                    )
                  : SizedBox.shrink(),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Payment Summary",
                        style: GoogleFonts.lato(
                            fontSize: 18, color: Colors.indigo),
                      ),
                    ),
                    ListTile(
                        subtitle: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Service Cost"),
                            Text("450"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Gst "),
                            Text("50"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total "),
                            Text("450"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text("Terms and Conditions"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ElevatedButton(
                onPressed: () {
                  UserBookingRequest userbooking = UserBookingRequest(
                      userId: SharePref().getUser()!.id,
                      startDate: selectedDate,
                      endDate: selectedDate!.add(Duration(days: 30)),
                      serviceType: "Ultimate",
                      paymentDone: true,
                      paymentId: "6578678",
                      carid: _seelctedCars!.id,
                      userlocation: _seelctedAddress!.id);

                  if (usersubscriptionbydateResponse!.usersubscriptionresult ==
                      null) {
                    ApiProvider(context)
                        .AddUserSubscriptions(UsersubscriptionAddRequest(
                      userId: SharePref().getUser()!.id,
                      plan: "64fd9ad322baee46f6d4313f",
                      startDate: DateTime.now(),
                      endDate: DateTime.now().add(Duration(days: 365)),
                    ))
                        .then((value) {
                      debugPrint("Subscriptions Added");
                    });
                  }

                  ApiProvider(context).NewBooking(userbooking).then((value) {
                    context.pushNamed(RouteNames.homepage);
                  });

                  // Get.to(() => UserHome());
                },
                child: Text("Payment")),
          )
        ]),
      ),
    );
  }

  @override
  void initState() {
    _seelctedAddress = SharePref().getSelectdAddress();
    _seelctedCars = SharePref().getSelectdCar();
    selectedDate = SharePref().getSelectdDate();
    getUserSubscriptions();

    setState(() {});
    debugPrint(_seelctedCars!.toJson().toString());
    debugPrint(_seelctedAddress!.toJson().toString());
    debugPrint(selectedDate!.toString());
    // TODO: implement initState
    super.initState();
  }

  getUserSubscriptions() {
    ApiProvider(context)
        .getUserSubscriptionsdate(SharePref().getUser()!.id!)
        .then((value) {
      usersubscriptionbydateResponse = value;
      setState(() {});
      return value;
    });
  }
}
