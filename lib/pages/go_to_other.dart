import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/name_controller.dart';
class Other extends StatelessWidget {
  const Other({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller counterController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(),icon: const Icon(Icons.arrow_back_ios),color: Colors.black,),
      ),
      body: Center(
        child: Text(counterController.counter.toString(),style: const TextStyle(fontSize: 25),),
      ),
    );
  }
}
