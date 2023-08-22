

import 'package:carwash/models/AddUserCarRequest.dart';
import 'package:carwash/models/AddUserCarResponse.dart';
import 'package:carwash/models/CarCompanyModelRequest.dart';
import 'package:carwash/models/CarCompanyResponse.dart';
import 'package:carwash/models/CarCompanymodelResponse.dart';
import 'package:carwash/models/UserRegisterRequest.dart';
import 'package:carwash/models/UserRegisterResponse.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/CarsByUserId.dart';
import '../models/LoginRequest.dart';
import '../models/LoginResponse.dart';

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



}