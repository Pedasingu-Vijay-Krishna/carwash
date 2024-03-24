import 'package:carwash/Services/ApiProvider.dart';
import 'package:carwash/SharePref/SharePref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/UserBookingByUserIdResponse.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Future<UserBookingByUserIdResponse>? userBookingByUserIdResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: FutureBuilder(
        future: userBookingByUserIdResponse,
        builder: (BuildContext context,
            AsyncSnapshot<UserBookingByUserIdResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.bookigresults!.isEmpty) {
              return Center(
                child: Text("No Booking"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.bookigresults!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Status"),
                                Text(snapshot.data!.bookigresults!
                                    .elementAt(index)
                                    .orderStatus
                                    .toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("OrderNumber"),
                                Text(snapshot.data!.bookigresults!
                                    .elementAt(index)
                                    .paymentId
                                    .toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Car Number"),
                                Text(snapshot.data!.bookigresults!
                                    .elementAt(index)
                                    .carid!
                                    .vehicleNumber
                                    .toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Address"),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text(snapshot.data!.bookigresults!
                                      .elementAt(index)
                                      .userlocation!
                                      .address
                                      .toString()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    userBookingByUserIdResponse = getBookings();
    // TODO: implement initState
    super.initState();
  }

  getBookings() {
    return ApiProvider(context)
        .bookingbyUserId(SharePref().getUser()!.id!)
        .then((value) {
      return value;
    });
  }
}
