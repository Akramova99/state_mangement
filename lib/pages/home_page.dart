import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_mangement/controllers/name_controller.dart';

import 'go_to_other.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    Controller counterController = Get.put(Controller());
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(
                "Clicks :${counterController.counter}",
                style: const TextStyle(color: Colors.white),
              )),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterController.increment();
          },
          backgroundColor: Colors.indigo,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade400)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          counterController
                              .onChangedName(nameController.text.trim());
                        },
                        child: Text("On changed ")),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Text("Name is ${counterController.name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    )
                  ],
                )),

            //SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(children: [
                const Image(image: AssetImage("assets/images/image.jpeg")),
                IconButton(
                    onPressed: () {
                      counterController.onClick();
                    },
                    icon: Obx(()=>Icon(

                      CupertinoIcons.heart_circle_fill,
                      size: 30,
                      color: counterController.isLike.value
                          ? Colors.white
                          : Colors.red,
                    ))),
              ]),
            ),
            // SizedBox(height: 20,),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.to(const Other()),
                child: const Text("Go to other"),
              ),
            ),
          ],
        ));
  }
}
