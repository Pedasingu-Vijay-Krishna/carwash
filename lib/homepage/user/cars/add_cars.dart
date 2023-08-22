import 'dart:convert';

import 'package:carwash/models/AddUserCarRequest.dart';
import 'package:carwash/models/CarCompanyModelRequest.dart';
import 'package:carwash/models/CarCompanymodelResponse.dart' as model;

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Services/ApiProvider.dart';
import '../../../models/CarCompanyResponse.dart';
import '../../../models/CarsmodelsResponse.dart';

class Addcars extends StatefulWidget {
  const Addcars({super.key});

  @override
  State<Addcars> createState() => _AddcarsState();
}

class _AddcarsState extends State<Addcars> {
  final box = GetSecureStorage();
  List<String> cars =[
    'assets/cars/Aston Martin.png',
    'assets/cars/Audi.png',
    'assets/cars/Bentley.png',
    'assets/cars/Benz.png',
    'assets/cars/BMW.png',
    'assets/cars/BYD.png',
    'assets/cars/Ferrari.png',
    'assets/cars/Force Motors.png',
    'assets/cars/Ford.png',
    'assets/cars/Honda.png',
    'assets/cars/Hyundai.png',
    'assets/cars/Isuzu.png',
    'assets/cars/Jaguar.png',
    'assets/cars/Jeep.png',
    'assets/cars/KIA.png',
    'assets/cars/Lamborghini.png',
    'assets/cars/Land rover.png',
    'assets/cars/Lexus.png',
    'assets/cars/Mahindra.png',
    'assets/cars/Marthi Suzuki.png',
    'assets/cars/Masterati.png',
    'assets/cars/McLaren.png',
    'assets/cars/MG.png',
    'assets/cars/MINI.png',
    'assets/cars/Nissan.png',
    'assets/cars/Porsche.png',
    'assets/cars/Renault.png',
    'assets/cars/Rolls-Royce.png',
    'assets/cars/Skoda.png',
    'assets/cars/TATA.png',
    'assets/cars/Toyota.png',
    'assets/cars/Volkswagen.png',
    'assets/cars/Volvo.png'

  ];

  List<Result> carsList=[];
  List<model.Result>? carModels=[];
  bool _isExpanded = false;
  String? selectedValue1;
  String? selectedValue2;
  String? variant_slect;
  String? color_select;

  bool loading = false;
  List<String> dropdownValues1 = ['Petrol', 'Diesel',  'Electric'];
  List<String> dropdownValues2 = ['Tube','Tubeless'];
  List<String> variant = ['Turbo','Top End'];
  List<String> color = ['Black','Blue','Gray','Green','Purple','Red','Silver','Tan','White','Yellow'];

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Result? selectedBrand;
  SelectedListItem? selectedModel;
  SelectedListItem? selectedTpe;
  List<SelectedListItem> selectModel=[];
  List<SelectedListItem> selectType=[];
//  Map<String,List<CarModels>> carModels={};
TextEditingController vechilenumber = TextEditingController();
TextEditingController vechilename = TextEditingController();
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    return  Scaffold(appBar: AppBar(title: Text("Add Car"),),

    body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: ListView(children: [

        Text("Car Details",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
        Space(),
        TextFormField(controller: vechilenumber,decoration: InputDecoration(hintText: "Vehicle Number"),),
        Space(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,

                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: carsList.map((e) => GestureDetector(onTap: (){

                    debugPrint(e.company);
                    debugPrint(e.picture);



                    selectedBrand = e;
                    selectModel = [];

                    selectedModel = null;
                    getModels(e.id!);

                    setState(() {

                    });
                   // debugPrint(d!.first.toJson().toString());
                    Navigator.pop(context);

                  },child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 80,child: Image.network(e.picture!,filterQuality: FilterQuality.low,)),
                        Container(child: Text(e.company.toString(),style: GoogleFonts.acme(fontSize: 16),)),
                      ],
                    ),
                  ),)).toList(),
                );
              },
            );
          },
          child: Container(
            padding: EdgeInsets.only(top: 15,bottom: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
              //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                       selectedBrand==null?'Select Car':selectedBrand!.company.toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
        Space(),
        GestureDetector(
          onTap: DisplayCarModel,
          child: Container(
            padding: EdgeInsets.only(top: 15,bottom: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
           //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                     selectedModel==null?'Selected Model':selectedModel!.name.toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
        Space(),
        GestureDetector(
       //   onTap: DisplayTypes,
          child: Container(
            padding: EdgeInsets.only(top: 15,bottom: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
           //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedModel==null?'Selected Model Type':carModels!.firstWhere((element) => element.id==selectedModel!.value.toString()).carModelType.toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
       Space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width/2.5,
              child: DropdownButton<String>(
                hint: Text("Fuel Type"),
                underline: Container(height: 1,color: Colors.grey,),
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                isExpanded: true,
                value: selectedValue1,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue1 = newValue;
                  });
                },
                items: dropdownValues1.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
// Add some spacing between the dropdowns
            SizedBox(
              width: size.width/2.5,
              child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(height: 1,color: Colors.grey,),
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                hint: Text("Tyre Type"),
                value: selectedValue2,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue2 = newValue;
                  });
                },
                items: dropdownValues2.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        Space(),
        Space(),
        Text("Additional Information",style:GoogleFonts.anekOdia(fontSize: 18),),
        Space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width/2.5,
              child: DropdownButton<String>(
                hint: Text("Variant"),
                underline: Container(height: 1,color: Colors.grey,),
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                isExpanded: true,
                value: variant_slect,
                onChanged: (newValue) {
                  setState(() {
                    variant_slect = newValue;
                  });
                },
                items: variant.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
// Add some spacing between the dropdowns
            SizedBox(
              width: size.width/2.5,
              child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(height: 1,color: Colors.grey,),
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                hint: Text("Color"),
                value: color_select,
                onChanged: (newValue) {
                  setState(() {
                    color_select = newValue;
                  });
                },
                items: color.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

          ],
        ),
        Space(),
        Container(height: 80,color: Colors.grey.shade100,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(controller: vechilename,decoration: InputDecoration(hintText: "Enter Vechile Name ",
            helperText: "Ex: My Car, My Dad's Car",
              hintStyle: TextStyle(fontSize: 14)

            ),),
          ),),

        Space(),
        Space(),
        loading?Center(child: CircularProgressIndicator(),) : ElevatedButton(onPressed: (){

          setState(() {
            loading =true;
          });
          var useird =box.read("user");
          debugPrint(useird['_id'].toString());
          AddUserCarRequest addUserCarRequest = AddUserCarRequest(userId: useird['_id'].toString(),variant: variant_slect,color: color_select,name:vechilename.text ,fueltype: selectedValue1,tyretype:selectedValue2 ,model: selectedModel!.value!,company: selectedBrand!.id,vehicleNumber: vechilenumber.text);
          ApiProvider(context).addUserCars(addUserCarRequest).then((value) {
            setState(() {
              loading =false;
            });

            context.pop(true);
          }).catchError((eeror){

            setState(() {
              loading =false;
            });
          });

        }, child: Text("Add Car"))
      ]),
    ),


    );
  }

  Widget Space(){

    return SizedBox(height: 10,);

  }

  @override
  void initState() {
  //  loadJsonData();

    getCars();
    

    // carsList.add(SelectedListItem(name: cars.elementAt(0),value: 'Aston Martin'));
    // carsList.add(SelectedListItem(name: cars.elementAt(1),value: 'Audi'));
    // carsList.add(SelectedListItem(name: cars.elementAt(2),value: 'Bentley'));
    // carsList.add(SelectedListItem(name: cars.elementAt(3),value: 'Mrcedes Benz'));
    // carsList.add(SelectedListItem(name: cars.elementAt(4),value: 'BMW'));
    // carsList.add(SelectedListItem(name: cars.elementAt(5),value: 'BYD'));
    // carsList.add(SelectedListItem(name: cars.elementAt(6),value: 'Ferreri'));
    // carsList.add(SelectedListItem(name: cars.elementAt(7),value: 'Force Motor'));
    // carsList.add(SelectedListItem(name: cars.elementAt(8),value: 'Ford'));
    // carsList.add(SelectedListItem(name: cars.elementAt(9),value: 'Honda'));
    // carsList.add(SelectedListItem(name: cars.elementAt(10),value: 'Hyandai'));
    // carsList.add(SelectedListItem(name: cars.elementAt(11),value: 'ISUZU'));
    // carsList.add(SelectedListItem(name: cars.elementAt(12),value: 'Jaguar'));
    // carsList.add(SelectedListItem(name: cars.elementAt(13),value: 'Jeep'));
    // carsList.add(SelectedListItem(name: cars.elementAt(14),value: 'KIA'));
    // carsList.add(SelectedListItem(name: cars.elementAt(15),value: 'Lamborghnini'));
    // carsList.add(SelectedListItem(name: cars.elementAt(16),value: 'Land Rover'));
    // carsList.add(SelectedListItem(name: cars.elementAt(17),value: 'Lexus'));
    // carsList.add(SelectedListItem(name: cars.elementAt(18),value: 'Mahindra'));
    // carsList.add(SelectedListItem(name: cars.elementAt(19),value: 'Maruti Suzuki'));
    // carsList.add(SelectedListItem(name: cars.elementAt(20),value: 'Mastrati'));
    // carsList.add(SelectedListItem(name: cars.elementAt(21),value: 'McLarn'));
    // carsList.add(SelectedListItem(name: cars.elementAt(22),value: 'MG'));
    // carsList.add(SelectedListItem(name: cars.elementAt(23),value: 'MINI'));
    // carsList.add(SelectedListItem(name: cars.elementAt(24),value: 'Nissan'));
    // carsList.add(SelectedListItem(name: cars.elementAt(25),value: 'Porsche'));
    // carsList.add(SelectedListItem(name: cars.elementAt(26),value: 'Renault'));
    // carsList.add(SelectedListItem(name: cars.elementAt(27),value: 'Rolls-Royce'));
    // carsList.add(SelectedListItem(name: cars.elementAt(28),value: 'Skoda'));
    // carsList.add(SelectedListItem(name: cars.elementAt(29),value: 'TATA'));
    // carsList.add(SelectedListItem(name: cars.elementAt(30),value: 'Toyota'));
    // carsList.add(SelectedListItem(name: cars.elementAt(31),value: 'Volkswogen'));
    // carsList.add(SelectedListItem(name: cars.elementAt(32),value: 'Volvo'));


    // for(int i=0;i<cars.length;i++){
    //
    //   carsList.add(SelectedListItem(name: cars.elementAt(i),value: i.toString()));
    //
    // }
    // TODO: implement initState
    super.initState();
  }

  // Create a function to read the JSON file
  Future<Map<String, dynamic>> readJsonFile(String filePath) async {
    final jsonString = await rootBundle.loadString(filePath);
    final jsonData = json.decode(jsonString);
    return jsonData;
  }

// Usage example
  void loadJsonData() async {
    final jsonData = await readJsonFile('assets/json/cars.json');



    jsonData.forEach((key, value) {


      List<CarModels> cars =[];

      for(var item in value){

        //  debugPrint(item['id'].toString() );
        //  debugPrint(item['company'].toString() );
        //  debugPrint(item['carModelType'].toString() );
        //  debugPrint(item['carModel'].toString() );

        cars.add(CarModels(id: item['id'].toString(),company: item['company'].toString(),carModelType: item['carModelType'].toString(),carModel: item['carModel'].toString()));
      }

      //    debugPrint(cars.toList().toString() );
    //  carModels[key]= cars;
    });


    // carModels['Volvo']!.toList().forEach((element) {
    //
    //   debugPrint(element.toJson().toString());
    // });
    //  debugPrint(carModels['Volvo']!.toList() as String?);
    // Access the JSON data
    final companies = jsonData['companies'];
    //   final carModels = jsonData['carModels'];
    final carModelTypes = jsonData['carModelTypes'];


    // Process the data as needed
    // ...
  }



  DisplayCarModel(){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Select Model",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: selectModel,
         listItemBuilder: (int){

          return ListTile(title: Text(selectModel.elementAt(int).name));

         },
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }

          selectedTpe = null;
          selectedModel =  selectedList.first;
       //   Navigator.pop(context);
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("s")));

          setState(() {

          });
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  DisplayTypes(){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Select Types",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: selectType,
         listItemBuilder: (int){

          return ListTile(leading: Icon(Icons.car_crash),title: Text(selectType.elementAt(int).value!));

         },
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }

          selectedTpe =  selectedList.first;
       //   Navigator.pop(context);
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("s")));

          setState(() {

          });
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  DisplayFuelType(){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Select Car",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: selectModel,
         listItemBuilder: (int){

          return ListTile(leading: Icon(Icons.car_crash),title: Text(selectModel.elementAt(int).name));

         },
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }

          selectedModel =  selectedList.first;
       //   Navigator.pop(context);
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("s")));

          setState(() {

          });
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  DisplayTyreType(){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Select Car",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: selectModel,
         listItemBuilder: (int){

          return ListTile(leading: Icon(Icons.car_crash),title: Text(selectModel.elementAt(int).name));

         },
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }

          selectedTpe =  selectedList.first;
       //   Navigator.pop(context);
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("s")));

          setState(() {

          });
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  getCars(){

    ApiProvider(context).getCars().then((value) {

      carsList = value.result!;


    });

  }

  getModels(String Id){

    ApiProvider(context).getCarmodels(CarCompanyModelRequest(company: Id)).then((value) {
      carModels = value.result;

      value.result!.forEach((element) {
        selectModel.add(SelectedListItem(name: element.carModel!,value: element.id));

      });
      setState(() {

      });
     // carsList = value.result!;


    });

  }
}

