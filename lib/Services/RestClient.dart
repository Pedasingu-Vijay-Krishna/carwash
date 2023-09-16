

import 'dart:convert';

import 'package:carwash/models/AddAddresss.dart';
import 'package:carwash/models/AddAddresssResponse.dart';
import 'package:carwash/models/AddUserCarRequest.dart';
import 'package:carwash/models/AddUserCarResponse.dart';
import 'package:carwash/models/CarCompanyModelRequest.dart';
import 'package:carwash/models/CarCompanyResponse.dart';
import 'package:carwash/models/CarCompanymodelResponse.dart';
import 'package:carwash/models/OrderByBetweendatesResponse.dart';
import 'package:carwash/models/OrderByBetweendatesResquest.dart';
import 'package:carwash/models/SubscriptionResponse.dart';
import 'package:carwash/models/UserAddresssResponse.dart';
import 'package:carwash/models/UserBookingByOrderIdResponse.dart';
import 'package:carwash/models/UserBookingByUserIdResponse.dart';
import 'package:carwash/models/UserBookingRequest.dart';
import 'package:carwash/models/UserBookingResponse.dart';
import 'package:carwash/models/UserRegisterRequest.dart';
import 'package:carwash/models/UserRegisterResponse.dart';
import 'package:carwash/models/UsersubscriptionAddRequest.dart';
import 'package:carwash/models/UsersubscriptionAddResponse.dart';
import 'package:carwash/models/UsersubscriptionresultbuuId.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../homepage/user/cars/add_cars.dart';
import '../models/CarsByUserId.dart';
import '../models/LoginRequest.dart';
import '../models/LoginResponse.dart';
import '../models/UsersubscriptionbydateResponse.dart';

part 'RestClient.g.dart';
@RestApi(baseUrl: "https://corgi-humane-completely.ngrok-free.app/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


  @POST("user/userLogin")
  Future<LoginResponse> userlogin(@Body() LoginRequest loginRequest);


  @POST("user/createUser")
  Future<LoginResponse> createlogin(@Body() UserRegisterRequest userRegisterRequest);

  @GET("/cars/carModel")
  Future<CarCompanyModelResponse> getCarmodels(@Body() CarCompanyModelRequest carCompanyModelRequest);

  @GET("/cars/carCompany")
  Future<CarCompanyResponse> getCars();

  @POST("/userCars/addUserCar")
  Future<AddUserCarResponse> addUserCars(@Body() AddUserCarRequest addUserCarRequest);

  @GET("/userCars/UserCars/{id}")
  Future<CarsByUserId> getUserCars(@Path() String id,);

 @GET("/userAddress/UserAddress/{id}")
  Future<UserAddresssResponse> getUserAddreess(@Path() String id,);

  @POST("/userAddress/addUserAddress")
  Future<AddAddresssResponse> addUserAddress(@Body() AddAddresss addAddresss);


  @POST("/subscritions/getsubscription")
  Future<SubscriptionResponse> getSubscriptions();

  @POST("/usersubscription/getsubscription/{id}")
  Future<UsersubscriptionresultbuuId> getUserSubscriptions(@Path() String id,);

  @POST("/usersubscription/getsubscriptionbyDate/{id}")
  Future<UsersubscriptionbydateResponse> getUserSubscriptionsdate(@Path() String id,);

  @POST("/usersubscription/addsubscription")
  Future<UsersubscriptionAddResponse> AddUserSubscriptions(@Body() UsersubscriptionAddRequest usersubscriptionAddRequest);

  @POST("/orders/userOrder")
  Future<UserBookingResponse> NewBooking(@Body() UserBookingRequest userBookingRequest);


  @POST("/orders/bookingsbyUserId")
  Future<OrderByBetweendatesResponse> getOrderByDates(@Body() OrderByBetweendatesResquest orderByBetweendatesResquest);

  @GET("/orders/orderbyId/{id}")
  Future<UserBookingByOrderIdResponse> bookingorderId(@Path() String id,);

  @GET("/orders/ordersbyUserId/{id}")
  Future<UserBookingByUserIdResponse> bookingbyUserId(@Path() String id,);

  @POST("/cars/carCompany")
  @MultiPart()
  Future<String> bookingstarted(
      @Part(name: "carlogos",) List<MultipartFile> files,
      @Part(name: "carcompany") String status,
      @Part(name: "carModel") List<CompyModel> startime,

      );

}