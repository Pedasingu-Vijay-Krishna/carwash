
import 'dart:developer';

import 'package:carwash/account/loginpage.dart';
import 'package:carwash/homepage/Coomingsoom.dart';
import 'package:carwash/homepage/serviceDetailPage.dart';
import 'package:carwash/homepage/user/address/UserAddress.dart';
import 'package:carwash/homepage/user/address/addAddress.dart';
import 'package:carwash/homepage/user/servicesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../account/signupPage.dart';
import '../homepage/user/History/history.dart';
import '../homepage/user/account/user_details.dart';
import '../homepage/user/cars/add_cars.dart';
import '../homepage/user/cars/cars_list.dart';
import '../homepage/user/service_summary.dart';
import '../homepage/user/subscriptions/details_subscritions.dart';
import '../homepage/user/useehomePage.dart';
import 'RoteName.dart';

 GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return  LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          name: RouteNames.login,
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {

            return  LoginPage();
          },
        ),  GoRoute(
          name: RouteNames.signupPage,
          path: 'signupPage',
          builder: (BuildContext context, GoRouterState state) {

            return  SignupPage();
          },
        ),  GoRoute(
          name: RouteNames.Addcars,
          path: 'Addcars',
          builder: (BuildContext context, GoRouterState state) {

            return  Addcars();
          },
        ),
        GoRoute(
          name: RouteNames.homepage,
          path: 'homepage',
          builder: (BuildContext context, GoRouterState state) {

            return const UserHome();
          },
        ),
        GoRoute(
          name: RouteNames.service,
          path: 'servicePage',
          builder: (BuildContext context, GoRouterState state) {
            return  ServicesPage();
          },
        ),
        GoRoute(
          name: RouteNames.commingsoon,
          path: 'commingsoon',
          builder: (BuildContext context, GoRouterState state) {
            return  ComingSoonPage(true);
          },
        ),

        GoRoute(
          name: RouteNames.ServiceSummary,
          path: 'ServiceSummary',
          builder: (BuildContext context, GoRouterState state) {
            return  ServiceSummary();
          },
        ),
        GoRoute(
          name: RouteNames.UserDetails,
          path: 'UserDetails',
          builder: (BuildContext context, GoRouterState state) {
            return  UserDetails();
          },
        ),    GoRoute(
          name: RouteNames.DeatilsSubscrition,
          path: 'DeatilsSubscrition',
          builder: (BuildContext context, GoRouterState state) {
            return  DeatilsSubscrition();
          },
        ),

        GoRoute(
          name: RouteNames.Carslist,
          path: 'Carslist',
          builder: (BuildContext context, GoRouterState state) {
            return  Carslist();
          },
        ),

   GoRoute(
          name: RouteNames.AddAddress,
          path: 'AddAddress',
          builder: (BuildContext context, GoRouterState state) {
            return  AddAddress();
          },
        ),
   GoRoute(
          name: RouteNames.Useraddress,
          path: 'userAddres',
          builder: (BuildContext context, GoRouterState state) {
            return  UserAddress();
          },
        ),
   GoRoute(
          name: RouteNames.HistoryPage,
          path: 'HistoryPage',
          builder: (BuildContext context, GoRouterState state) {
            return  HistoryPage();
          },
        ),

        GoRoute(
          name: RouteNames.serviceDetails,
          path: 'servicedetails',
          builder: (BuildContext context, GoRouterState state) {

            return ServiceDetails(id:  state.uri.queryParameters['id']!,servicename:  state.uri.queryParameters['servicename']!,);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(body: Center(child: Text(state.error.toString()))),
);
