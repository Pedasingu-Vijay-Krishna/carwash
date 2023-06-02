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

    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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
                    Image.network(item, fit: BoxFit.cover, width: 1000)),
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
              items:  imgList
                  .map((item) => Container(
                child: Center(
                    child:
                    Image.network(item, fit: BoxFit.cover, width: 1000)),
              ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio:(16/9),
                enlargeCenterPage: true,
                viewportFraction: 0.5,
              ),
            ),

          ],
        ),
      ),
    );
  }


}