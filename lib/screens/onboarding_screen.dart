import 'package:flutter/material.dart';
import 'package:ismail_recipe_app_2/constant/images_path.dart';
import 'package:ismail_recipe_app_2/screens/home.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
                child: Container(
                  height: h*.79,
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                    image: AssetImage(ImagesPath.onBoarding,)
                    )
                  ),
                ),
            ),
            Center(
              child: Image.asset(ImagesPath.onBoarding),

            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: h*.243,
                  width: w,
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: h*.032),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Lets get cooking',
                        style: TextStyle(
                          fontSize: w*.06,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                      SizedBox(height: h*.01,),
                      const Text('Check out this delicious meals',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                      ),
                      ),
                    SizedBox(height: h*.032,),
                    SizedBox(
                      width: w*.8,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context)=>const Home()));
                          },
                          child: const Text('Lets Get Cooking',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),),
                    ),
                      ],
                    ),
                  ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
