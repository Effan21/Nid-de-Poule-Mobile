import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_fonts/google_fonts.dart';
class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const PanelWidget({Key? key, required this.controller,required this.panelController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 12,),
        buildDragHandle(),
        const SizedBox(height: 10,),
        buildAboutText(),

      ],
    );
  }

  Widget buildAboutText() =>
      Container(

        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                  'Je Signale...',
              style: GoogleFonts.lobster(
                textStyle: TextStyle( fontSize: 20, color: Colors.black87, letterSpacing: 2, fontWeight: FontWeight.bold)
              )),

            ),
            const SizedBox(height: 30,),
            Center(
              child: Container( child: TextButton(onPressed: () {  }, child: Row(
            children: [
              SizedBox(width: 20,),
           Icon(Icons.campaign_rounded, color: Colors.white,size: 30,),
              SizedBox(width: 30,),
              Text('Un nid de Poule', style: GoogleFonts.openSans(
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
              )
              )

  ],
  ),),
                width: 320,
                height: 60,
               decoration: BoxDecoration(color: Colors.red[500],borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                child: TextButton(onPressed: () {  }, child: Row(
                  children: [SizedBox(width: 20,),
                    Icon(Icons.check_circle, color: Colors.white,size: 25,),
                    SizedBox(width: 30,),
                    Text('Une Réparation', style: GoogleFonts.openSans(
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
                    )
                    )
                  ],
                ),),
                width: 320,
                height: 60,
                decoration: BoxDecoration(color: Colors.green[500],borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),

      );

  Widget buildDragHandle() => GestureDetector(
    child: Center(
      child: Container(
        width: 50,
        height: 5,
        decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(12))
      ),
    ),
    onTap: togglePanel,
  );

  void togglePanel() => panelController.isPanelOpen
                    ? panelController.close()
                    : panelController.open();

}

