import 'package:carwash/Services/RestClient.dart';
import 'package:carwash/models/AddAddresss.dart';
import 'package:carwash/models/AddAddresssResponse.dart';
import 'package:carwash/models/AddUserCarRequest.dart';
import 'package:carwash/models/AddUserCarResponse.dart';
import 'package:carwash/models/CarCompanyModelRequest.dart';
import 'package:carwash/models/CarCompanyResponse.dart';
import 'package:carwash/models/CarCompanymodelResponse.dart';
import 'package:carwash/models/LoginRequest.dart';
import 'package:carwash/models/LoginResponse.dart';
import 'package:carwash/models/SubscriptionResponse.dart';
import 'package:carwash/models/UserBookingByOrderIdResponse.dart';
import 'package:carwash/models/UserBookingByUserIdResponse.dart';
import 'package:carwash/models/UserBookingRequest.dart';
import 'package:carwash/models/UserBookingResponse.dart';
import 'package:carwash/models/UserRegisterRequest.dart';
import 'package:carwash/models/UsersubscriptionAddRequest.dart';
import 'package:carwash/models/UsersubscriptionAddResponse.dart';
import 'package:carwash/models/UsersubscriptionbydateResponse.dart';
import 'package:carwash/models/UsersubscriptionresultbuuId.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../homepage/user/cars/add_cars.dart';
import '../models/CarsByUserId.dart';
import '../models/UserAddresssResponse.dart';
class ApiProvider implements RestClient{

  BuildContext context;

  Dio dio = Dio();

  String url ="https://corgi-humane-completely.ngrok-free.app/api/v1/";
  ApiProvider(this.context);

  @override
  Future<LoginResponse> userlogin(LoginRequest loginRequest) {

    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.userlogin(loginRequest).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });

    // TODO: implement userlogin
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> createlogin(UserRegisterRequest userRegisterRequest) {


    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.createlogin(userRegisterRequest).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });

    // TODO: implement createlogin
    throw UnimplementedError();
  }

  @override
  Future<CarCompanyModelResponse> getCarmodels(CarCompanyModelRequest carCompanyModelRequest) {

    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.getCarmodels(carCompanyModelRequest).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement getCarmodels
    throw UnimplementedError();
  }

  @override
  Future<CarCompanyResponse> getCars() {


    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.getCars().then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement getCars
    throw UnimplementedError();
  }

  @override
  Future<AddUserCarResponse> addUserCars(AddUserCarRequest addUserCarRequest) {


    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.addUserCars(addUserCarRequest).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement addUserCars
    throw UnimplementedError();
  }

  @override
  Future<CarsByUserId> getUserCars(String id) {


    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.getUserCars(id).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement getUserCars
    throw UnimplementedError();
  }

  @override
  Future<AddAddresssResponse> addUserAddress(AddAddresss addAddresss) {

    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.addUserAddress(addAddresss).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement addUserAddress
    throw UnimplementedError();
  }

  @override
  Future<UserAddresssResponse> getUserAddreess(String id) {

    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.getUserAddreess(id).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement getUserAddreess
    throw UnimplementedError();
  }

  @override
  Future<SubscriptionResponse> getSubscriptions() {
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.getSubscriptions().then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement getSubscriptions
    throw UnimplementedError();
  }

  @override
  Future<UsersubscriptionAddResponse> AddUserSubscriptions(UsersubscriptionAddRequest usersubscriptionAddRequest) {

    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.AddUserSubscriptions(usersubscriptionAddRequest).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement AddUserSubscriptions
    throw UnimplementedError();
  }

  @override
  Future<UsersubscriptionresultbuuId> getUserSubscriptions(String id) {
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.getUserSubscriptions(id).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement getUserSubscriptions
    throw UnimplementedError();
  }

  @override
  Future<UsersubscriptionbydateResponse> getUserSubscriptionsdate(String id) {

    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.getUserSubscriptionsdate(id).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement getUserSubscriptionsdate
    throw UnimplementedError();
  }

  @override
  Future<UserBookingResponse> NewBooking(UserBookingRequest userBookingRequest) {

    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.NewBooking(userBookingRequest).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement NewBooking
    throw UnimplementedError();
  }

  @override
  Future<UserBookingByUserIdResponse> bookingbyUserId(String id) {
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.bookingbyUserId(id).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement bookingbyUserId
    throw UnimplementedError();
  }

  @override
  Future<UserBookingByOrderIdResponse> bookingorderId(String id) {
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.bookingorderId(id).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
    // TODO: implement bookingorderId
    throw UnimplementedError();
  }

  @override
  Future<String> bookingstarted(List<MultipartFile> files, String status, List<CompyModel> startime,) {

    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final _resclient = RestClient(dio);

    return  _resclient.bookingstarted(files,status,startime).then((value) =>value).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioException:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioException).response;

          debugPrint("Got error : ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });   // TODO: implement bookingstarted
    throw UnimplementedError();
  }

}