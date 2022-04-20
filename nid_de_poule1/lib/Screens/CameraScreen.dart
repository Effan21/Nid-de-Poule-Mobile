import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  File? imageFile;

  void _getFromCamera() async {
    XFile? pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1000,
      maxWidth: 1000,
    ));
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 70,),
                  Center(child: Text('Recommandations',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2,color: Colors.redAccent)))),
                  SizedBox(width: 10,),
                  Icon(Icons.lightbulb, color: Colors.amber,size: 25,),
                ],
              ),

              SizedBox(height: 30,),
              Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                width: 240,
                height: 240,
                child: Image.network("https://img.freepik.com/free-vector/giant-dirty-deep-pothole-broken-car-wheel-warning-triangle-road_376504-173.jpg?w=740")
              ),
          SizedBox(height: 50,),
          Row(
            children: [
              SizedBox(width: 20,),
              Text('Comme recommandations ...',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)))
            ],

          ),
          SizedBox(height:30,),
          Row(
            children: [
              SizedBox(width: 20,),
              Text('1 -',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
              SizedBox(width: 10,),
              Text('Prenez juste en photo le nid de poule',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            ],

          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 20,),
              Text('2 -',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
              SizedBox(width: 10,),
              Text('Soyez le plus proche possible du Nid de Poule',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            ],

          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 20,),
              Text('3 -',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
              SizedBox(width: 5,),
              Text('Garder le téléphone à une distance raisonable',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            ],

          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 20,),
              Text('4 -',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
              SizedBox(width: 5,),
              Text('Assurer vous que le nid de poule soit visible',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            ],

          ),

          SizedBox(height: 70,),

          Container(

            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(

              child: TextButton(onPressed: () { _getFromCamera();  }, child: Row(
                children: [SizedBox(width: 20,),
                  Icon(Icons.camera_enhance_rounded, color: Colors.white,size: 25,),
                  SizedBox(width: 35,),
                  Text('Prendre en photo', style: GoogleFonts.openSans(
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
                  )
                  )
                ],
              ),),
              width: 320,
              height: 60,
              decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.circular(20)),
            ),
          ),



        ],
      ),
    );
  }
}
