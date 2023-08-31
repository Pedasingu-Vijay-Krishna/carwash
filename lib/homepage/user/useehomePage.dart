import 'package:carousel_slider/carousel_slider.dart';

import 'package:carwash/homepage/user/Userhistory.dart';
import 'package:carwash/homepage/user/account/user_details.dart';
import 'package:carwash/homepage/user/cars/cars_list.dart';
import 'package:carwash/homepage/user/servicesPage.dart';
import 'package:carwash/homepage/user/subscriptions/details_subscritions.dart';
import 'package:carwash/router/RoteName.dart';
import 'package:carwash/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Coomingsoom.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final List<String> services = [
    'Car Wash',
    'Car Repair',
    'Fastag',

  ];
  final List<String> items = List.generate(100, (index) => 'Item $index');
  final box = GetSecureStorage();
  PageController controller =PageController(initialPage: 0);
  int index =0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<String> textList = [
    "The quick brown fox jumps over the lazy dog.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "A journey of a thousand miles begins with a single step.",
    "The sun rises in the east and sets in the west.",
    "Two wrongs don't make a right.",
    "Actions speak louder than words.",
    "Happiness can be found even in the darkest of times if one only remembers to turn on the light.",
    "In the midst of chaos, there is also opportunity.",
    "Life is what happens when you're busy making other plans.",
    "Believe you can and you're halfway there."
  ];
  final List<String> imgList = [

    'assets/serives_cursol/AC vents cleaning.jpg',
    'assets/serives_cursol/Bumper Cleaning.jpg',
    'assets/serives_cursol/car-wash-detailing-station.jpg',
    'assets/serives_cursol/Dashboard Cleaning.jpg',
    'assets/serives_cursol/Dashboard polishing.jpg',
    'assets/serives_cursol/Exterior Cleaning.jpg',
    'assets/serives_cursol/Interior Vaccum Cleaning.jpg',
    'assets/serives_cursol/Mats Cleaning.jpg',
    'assets/serives_cursol/Seat Cleaning.jpg',
    'assets/serives_cursol/shampoo Cleaning.jpg',
    'assets/serives_cursol/Tpre Cleaning.jpg',
    'assets/serives_cursol/Tyre Polishing.jpg'

  ];

  final List<String> brantpattner = [

    'assets/brand_pattner_images/3m.png',
    'assets/brand_pattner_images/Fraber.png',
    'assets/brand_pattner_images/Menzerra.png',
    'assets/brand_pattner_images/ShineXpro.png',
    'assets/brand_pattner_images/Softspun.png',
    'assets/brand_pattner_images/WaveX.png',
  ];



  final List<String> service_images = [

    'assets/services_images/standard.jpg',
    'assets/Repair Image.jpg',
    'assets/FasTag.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    final itemCount = items.length;
    final displayItemCount = 6;
    Size size = MediaQuery.of(context).size;
    return  Scaffold(backgroundColor: Colors.white,appBar: AppBar(backgroundColor: ColorsList.black,centerTitle: false,title: Text("Company Name",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
        actions: [
      // IconButton(onPressed: (){
      //
      // //  Get.off(() => PatnerHomePage());
      //
      // }, icon: Icon(Icons.account_circle_outlined,size: 25,color: Colors.white,))

        ]),
    bottomNavigationBar: BottomNavigationBar(

      backgroundColor: ColorsList.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      onTap: (inde){
        index = inde;
        controller.jumpToPage(inde);
        setState(() {

        });
      },
      elevation: 5.0,
      currentIndex: index,
      items: [
      
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.history),label: 'History'),
      BottomNavigationBarItem(icon: Icon(Icons.reviews),label: 'Reviews'),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Account')

    ],),
    body:  PageView(

      onPageChanged: (ser){

        index = ser;
        setState(() {

        });

      },
      controller: controller,
      children: [
        SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                CarouselSlider(
                  items:  imgList
                      .map((item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(15.0),
                            child:
                            Image.asset(item, fit: BoxFit.fill,width: 1000 ,)),
                      ))
                      .toList(),
                  options: CarouselOptions(
                  autoPlay: true,
                //  enlargeCenterPage: true,
                 // aspectRatio: 2.,
                      viewportFraction: 0.8,
                  aspectRatio: 2.5,
                  onPageChanged: (index, reason) {
                  setState(() {
                  _current = index;
                  });
                  }),
                  ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 5.0,
                        height: 5.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [

                    Text("Services",style: GoogleFonts.lato(fontSize: 20,color: ColorsList.pink_red,fontWeight: FontWeight.bold)),


                  ],),
                ),


                SizedBox(
                  height:130,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns in the grid
                      mainAxisSpacing: 15.0, // Spacing between rows
                      crossAxisSpacing: 5.0, // Spacing between columns
                    ),
                    itemCount: service_images.length,
                    // Total number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      // Build each item in the grid
                      return GestureDetector(
                        onTap: (){
                          if(index==0){


                            GoRouter.of(context).pushNamed(RouteNames.service);

                          }else{
                            GoRouter.of(context).pushNamed(RouteNames.commingsoon);
                          }

                        },
                        child: Container(

                        //  color: Colors.blue,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [


                              CircleAvatar(
                                radius: 40,
                               // maxRadius: 50,
                                // Adjust the radius according to your preference
                                backgroundImage: AssetImage(service_images.elementAt(index)), // Replace with your asset path
                              ),

                            Text(services.elementAt(index),style: GoogleFonts.poppins(fontWeight: FontWeight.bold),)


                          ],)

                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30,),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5.0),
                //   child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                //
                //  //   Text("MarketPlace",style: GoogleFonts.lato(fontSize: 20,color: ColorsList.pink_red,fontWeight: FontWeight.bold)),
                //
                //
                //
                //   ],),
                // ),

                CarouselSlider(
                  items:  imgList
                      .map((item) => Container(
                  //  child: Container(color: Colors.grey.shade50,child: Text(" Market Place "),),
                     child: Center(
                         child:
                         Image.asset(item, fit: BoxFit.cover,height: 50, width: 1000)),
                  ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 8.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                        //  _current = index;
                        });
                      }),
                ),
                SizedBox(height: 30,),
             //   SizedBox(height: 30,),
               // Expanded(flex: 1,child: Container(color: Colors.white,)),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text("Brand Partners",style: GoogleFonts.lato(fontSize: 20,color: ColorsList.pink_red,fontWeight: FontWeight.bold)),
                ],),
                SizedBox(height: 20,),
                CarouselSlider(
                  items:  brantpattner
                      .map((item) => Container(
                    child: CircleAvatar(
                      radius: 30,
                        child:
                        Image.asset(item, fit: BoxFit.fill,height: 50, width: 100)),
                  ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      height: 50,
                      enlargeCenterPage: true,
                      viewportFraction: 0.2,
                      animateToClosest: true
                  ),
                ),

                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text("Testmonials",style: GoogleFonts.lato(fontSize: 20,color: ColorsList.pink_red,fontWeight: FontWeight.bold)),
                ],),

                SizedBox(height: 20,),
                CarouselSlider(
                  items:  textList
                      .map((item) => Container(
                    child: Text(item),
                  ))
                      .toList(),
                  options: CarouselOptions(
                    height: 60,
                      autoPlayCurve: Curves.easeInBack,
                      pageSnapping: true,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.6,
                      animateToClosest: true
                  ),
                ),
              ],
            ),
          ),
        ),
    UserHistory(),
        ComingSoonPage(false),
        Column(children: [



          // ListTile(onTap: (){
          //
          // //  Navigator.pushNamed(context, RoutesName.ACCOUNTDETAILS);
          //
          // },subtitle:    Text("Account Details"),leading: FlutterLogo(),title:  Text("Jhon Doe",style: GoogleFonts.lato(fontWeight: FontWeight.w800)),trailing: Icon(Icons.keyboard_arrow_right_outlined),),
          //
          // Divider(),


          SizedBox(height: 30,),

          Expanded(
            child: ListView(children: [

              ListTile(onTap: (){


                context.pushNamed(RouteNames.UserDetails);
             //   Get.to(() => UserDetails());


              },title:  Text("My Account",style: GoogleFonts.lato(fontWeight: FontWeight.w800)),subtitle:    Text("Spread the Word and Get Rewarded!",style: GoogleFonts.lato(fontSize: 12),),leading: Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.shade200),child: Icon(Icons.account_circle_outlined,)),),
              Divider(indent: 75,endIndent: 5,thickness: 2),
              ListTile(onTap: (){

             context.pushNamed(RouteNames.Carslist);

              },title:  Text("My Cars",style: GoogleFonts.lato(fontWeight: FontWeight.w800)),subtitle:    Text("Cars Details",style: GoogleFonts.lato(fontSize: 12),),leading: Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.shade200),child: Icon(CupertinoIcons.cart,)),),
              Divider(indent: 75,endIndent: 5,thickness: 2),
                  ListTile(onTap: (){

             context.pushNamed(RouteNames.HistoryPage);

              },title:  Text("Orders History",style: GoogleFonts.lato(fontWeight: FontWeight.w800)),subtitle:    Text("Orders, Tracking, Details",style: GoogleFonts.lato(fontSize: 12),),leading: Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.shade200),child: Icon(Icons.history,)),),


              Divider(indent: 75,endIndent: 5,thickness: 2),
                 ListTile(onTap: (){

             context.pushNamed(RouteNames.Useraddress);

              },title:  Text("My Address",style: GoogleFonts.lato(fontWeight: FontWeight.w800)),subtitle:    Text("Add Address,List Address",style: GoogleFonts.lato(fontSize: 12),),leading: Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.shade200),child: Icon(CupertinoIcons.home,)),),
              Divider(indent: 75,endIndent: 5,thickness: 2),
              ListTile(onTap: (){

                context.pushNamed(RouteNames.DeatilsSubscrition);

              },title:  Text("My Subscritions",style: GoogleFonts.lato(fontWeight: FontWeight.w800)),subtitle:    Text("Manage your Bank Details here",style: GoogleFonts.lato(fontSize: 12),),leading: Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.shade200),child: Icon(Icons.add_card_rounded,)),),
              Divider(indent: 75,endIndent: 5,thickness: 2),
              ListTile(title:  Text("Help & Support",style: GoogleFonts.lato(fontWeight: FontWeight.w800)),subtitle:    Text("FAQs, Customer care and more",style: GoogleFonts.lato(fontSize: 12),),
                leading: Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.shade200),child: Icon(CupertinoIcons.question_circle,)),),
              Divider(indent: 75,endIndent: 5,thickness: 2),
              SizedBox(height: 50,),
              InkWell(onTap: () async {

                await  box.erase();

                context.pushReplacementNamed(RouteNames.login);
              //  Get.offAllNamed(RoutesName.LOGIN);
              },child: Center(child: Text("Signout",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w900),)))


            ],),
          )

        ]),

      ],
    ),

    );
  }
}
