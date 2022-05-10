import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marketo/components/art_widget.dart';
import 'package:marketo/components/shape.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/screens/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    List<Widget> items = [
      const ArtWidget(iconPath: 'assets/icons/shopping_cart.svg', description: 'Marketo will help you plan your purchases better.'), 
      const ArtWidget(iconPath: 'assets/icons/to_do_list.svg', description: 'Create a complete list with the tools that Marketo offers.'), 
      const ArtWidget(iconPath: 'assets/icons/empty_car.svg', description: 'Edit, set a price or sort the products on your list by category.')
    ].map((e) => Builder(
      builder: (BuildContext context){
        return Container(
          width: size.width,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: e,
        );
      })).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blue,
        elevation: 0,
        title: const Text('Welcome'),
      ),
      backgroundColor: white,

      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipPath(
              clipper: MyShape(),
              child: Container(
                color: grey,
                height: 220,
                width: size.width,
              ),
            )
          ),

          Positioned(
            top: 0,
            child: ClipPath(
              clipper: MyShape(),
              child: Container(
                color: blue,
                height: 200,
                width: size.width,
              ),
            ),
          ),


          SizedBox(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: items, 
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 350, 
                    onPageChanged: (index, reason){
                      setState(() {
                        activeIndex = index;
                      });
                    }
                  ),
                ),
            
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 90),
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex, 
                    count: items.length,
                    effect: SlideEffect(
                      activeDotColor: blue,
                      dotColor: grey,
                      spacing: 20
                    ),
                  ),
                )
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: size.width,
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                }, 
                child: const Text('Get Started', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  primary: blue,
                  minimumSize: Size(size.width, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}