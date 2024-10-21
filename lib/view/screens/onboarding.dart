import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/onBoardingController.dart';
import 'package:flutter_application_1/data/data%20source/static/static.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Onboarding extends GetView<Onboardingcontroller> {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(Onboardingcontroller());
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(itemCount: onBoardingList.length,
            onPageChanged: (value) {
              controller.onPageChanged(value);
            } ,
            controller: controller.pageController,
            itemBuilder: (context,index)=>
            Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(onBoardingList[index].title.toString()),
                SizedBox(height: 30,),
                Image.asset(onBoardingList[index].image!,height: 250,width: 200,fit: BoxFit.fill,),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(onBoardingList[index].body.toString()))
            
              ],
            )
            ),
          ),
          Expanded(flex: 1,child:
          Column(
            children: [
              GetBuilder<Onboardingcontroller>(builder:(controller)=>Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(4, (index) =>AnimatedContainer(
                    width: controller.pageC == index ?20 :5,
                    height: 6,
                    duration: Duration(milliseconds: 900),
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
                ],
              ),)
              
             , const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  width: double.infinity,
                  child: GetBuilder<Onboardingcontroller>(
                    builder: (controller) {
                      return ElevatedButton(onPressed: (){
                        controller.next();
                      }, child: Text('Continue'),
                      
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),);
                    }
                  ),
                ),
              )
            ],
          )
           )
        ],
      ),
    ));
  }
}