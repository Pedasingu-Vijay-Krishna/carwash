import 'package:carousel_slider/carousel_slider.dart';
import 'package:carwash/account/becameapattner.dart';
import 'package:carwash/account/loginpage.dart';
import 'package:carwash/account/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Name'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Company Name
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Company Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Infinite Carousel
            CarouselSlider(
              items:  imgList
                  .map((item) => Container(
                child: Center(
                    child:
                    Image.asset(item, fit: BoxFit.cover, width: 1000)),
              ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.6,
                animateToClosest: true
              ),
            ),

            SizedBox(height:size.height*0.04,),
            // Login and Signup Buttons
            ElevatedButton(
              onPressed: () {

                Get.to(()=>LoginPage(),duration: Duration(seconds: 2));
             //   Get.to(()=>SignupPage());

                // Handle "Become a Partner" button press
              },
              child: Text('            Login             '),
            ),

           SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Get.to(() => SignupPage(),duration: const Duration(seconds: 2));
              },
              child: const Text.rich(  TextSpan(
               text: "Don't Have an Account, ",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),
               children: [
                 TextSpan(
                   text: 'Sign up',
                   style: TextStyle(
                     fontStyle: FontStyle.italic,
                     color: Colors.indigo,
                   ),
                 ),

               ],
           ),),
            ),
            SizedBox(height: size.height*0.02,),
            // "Become a Partner" Button
            ElevatedButton(

              onPressed: () {
                Get.to(() => BecameaPattner(),duration: Duration(seconds: 2),curve: Curves.fastEaseInToSlowEaseOut);
                // Handle "Become a Partner" button press
              },
              child: Text('Become a Partner ? '),
            ),


            SizedBox(height:size.height*0.01,),
            // Brand Partners Carousel
            CarouselSlider(
              items:  brantpattner
                  .map((item) => Container(
                child: Center(
                    child:
                    Image.asset(item, fit: BoxFit.cover, width: 1000)),
              ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
               // aspectRatio:(16/9),
                enlargeCenterPage: true,
                viewportFraction: 0.2,
              ),
            ),

          ],
        ),
      ),
    );
  }


}