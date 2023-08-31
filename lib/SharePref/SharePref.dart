import 'package:get_secure_storage/get_secure_storage.dart';

import '../models/CarsByUserId.dart' as cars;
import '../models/LoginResponse.dart';
import '../models/SubscriptionResponse.dart';
import '../models/UserAddresssResponse.dart' as address;
class SharePref{

  final box = GetSecureStorage();



  Result? getUser(){

    return box.read('user')==null?null: Result.fromJson( box.read('user') );

  }


  Future<bool> setUser(Result result){


    return box.write("user", result.toJson()).then((value) {

      return true;
    });
  }


  Future<void> setSelectedCar(cars.Result result){


    return box.write("selectedCar", result).then((value) {

      return true;
    });
  }

  cars.Result getSelectdCar(){

    return    box.read('selectedCar');

  }
  address.Result getSelectdAddress(){
    return    box.read('SelectedAddress');
  }
  Future<void> setUserAddress(address.Result result){


    return box.write("SelectedAddress", result).then((value) {

      return true;
    });
  }

  DateTime getSelectdDate(){

    return   box.read('selectedDate');

  }
  Future<void> setDate(DateTime result){

    return box.write("selectedDate", result).then((value) {

      return true;
    });
  }


  Future<bool> setUserSubscritions(Subscriptionresult result){
    return box.write("UserSubscrition", result).then((value) {

      return true;
    });

  }
  Subscriptionresult getUserSubscritions(){

    return   box.read('UserSubscrition');
  }


}