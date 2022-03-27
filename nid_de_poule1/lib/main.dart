import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:nid_de_poule1/panel_widget.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);





  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Nid de poule',
      home:  MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final panelHeightOpened = MediaQuery.of(context).size.height * 0.3;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1 ;
    return SafeArea(
      child: Scaffold(
        
        body: SlidingUpPanel(
          color: Color(0xffede9e6),
          controller: panelController,
          maxHeight: panelHeightOpened,
          minHeight: panelHeightClosed,
          body: FlutterMap(
            options: MapOptions(
              center: LatLng(	5.316667, -4.033333),
              zoom: 15.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",

                subdomains: ['a', 'b', 'c'],
              ),

            ],
          ),
          panelBuilder: (controller) => PanelWidget(
            controller:controller,
            panelController: panelController,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          parallaxEnabled: true,
          parallaxOffset: .5,
        ),
      ),
    );
  }


}
