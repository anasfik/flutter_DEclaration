import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'complaint_controller.dart';




class ComplaintPage extends GetView<ComplaintController> {
  ComplaintPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> declarationKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: declarationKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Text(
                    "Ajouter une déclaration",
                    style: GoogleFonts.poppins(fontSize: 25 ,color: Colors.black,fontWeight: FontWeight.bold),
                  ),

                  Image.asset(
                    "assets/images/ajouter.png",
                    height: 300,
                  ),

                  const SizedBox(
                    height: 3,
                  ),TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Titre",
                      prefixIcon: const Icon(Icons.title),
                    ),
                    keyboardType: TextInputType.multiline,
                    controller: controller.titreConroller,
                    textInputAction: TextInputAction.newline,

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Description",
                      prefixIcon: const Icon(Icons.comment),
                    ),
                    keyboardType: TextInputType.multiline,
                    controller: controller.descController,
                    minLines: 1,
                    maxLines: 5,
                    textInputAction: TextInputAction.newline,

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Address",
                      prefixIcon: const Icon(Icons.maps_home_work),
                    ),
                    keyboardType: TextInputType.multiline,
                    controller: controller.addressController,

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Categorie",
                      prefixIcon: const Icon(Icons.category),
                    ),
                    keyboardType: TextInputType.multiline,
                    controller: controller.cateController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
              Obx(
                  ()=>controller.selectedImagePath.value=="" ?SizedBox(height:150,width: 150,child: Image.asset( "assets/images/nophoto.png",

                  ) ,)

                      : Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),child: SizedBox(height:280,width: 280,child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: FileImage(File(controller.selectedImagePath.value)))) ,)))

              ),



              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: context.width),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  ),
                  child: const Text(
                    "choisir une photo",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                          height: 130,
                          color: Colors.black54,
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 120,
                                child: ElevatedButton.icon(
                                  icon:const Icon(
                                      Icons.camera_alt
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    backgroundColor:
                                    MaterialStateProperty.all(const Color(0xFFB1EA37)),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                                  ),
                                  label: const Text(
                                    "Camera",
                                    style: const TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    controller.getImage(ImageSource.camera);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 120,
                                child: ElevatedButton.icon(
                                  icon:const Icon(
                                    Icons.photo_sharp
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    backgroundColor:
                                    MaterialStateProperty.all(const Color(0xFFB1EA37)),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                                  ),
                                  label: const Text(
                                    "Gallery",
                                    style: TextStyle(fontSize: 14, color: Colors.white),
                                  ),

                                  onPressed: () {
                                    controller.getImage(ImageSource.gallery);
                                  },
                                ),
                              ),

                            ],
                          )
                      ),);
                  },
                ),
              ),
                  const SizedBox(
                    height: 16,
                  ),

                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFB1EA37)),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                      ),
                      child: const Text(
                        "Valide",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                            controller.valider();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
