
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboardingcontroller extends GetxController{
  int pageC =0;
  late PageController pageController;
  @override
  void onInit() {
    
    super.onInit();
    pageController =PageController();
  }
  @override
  void onClose() {
   
    super.onClose();
  }
  @override
  void onReady() {
    
    super.onReady();
  }


  void onPageChanged(int index){
    pageC =index;
    update();

  }
  void next(){
    pageController.animateToPage(pageC+1, duration: Duration(microseconds: 900), curve: Curves.easeInOut);


  }

}