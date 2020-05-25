/*
   The layout of page which will appear after the worker will open the job 
which is specified in the work card in the work section . 
 */

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:laundry/pick_drop_ui/pages/work_page_functionalities/during_navigation.dart';
import 'package:flutter/rendering.dart';
import 'package:laundry/pick_drop_ui/pages/work_page_functionalities/maps_functions.dart';



Future<bool> workDescription(context,name , address){

	return showDialog(
			context: context,
			builder: (BuildContext context) => MapPage()
	);
}




class MapPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}


class _MapPageState extends State<MapPage>{
	Completer<GoogleMapController> _controller = Completer();
	static final CameraPosition _intial = CameraPosition(target: LatLng(28.640884,77.126071), zoom: 15);
	 List<Marker> markers = [];
	 @override
  void initState() {
    super.initState();
    markers.add(Marker(
			markerId: MarkerId("Sanjog House"),
			draggable: false,
			onTap: (){
				print("Tapped");
			},
			position: LatLng(28.640884,77.126071)
		));
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
			shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(10)
			),
			title: Text("Job Assigned"),
			backgroundColor: Colors.lightBlueAccent,
			
	    
	    content:SingleChildScrollView(
	      child: Container(
	      	height: 300,
	      	width: 220,
	      	child: Center(
	      		child: GoogleMap(
	      			initialCameraPosition: _intial,
	      			markers: Set.from(markers),
	      			mapType: MapType.normal,
	      			onMapCreated: (GoogleMapController controller){
	      				_controller.complete(controller);
	      			},),
	      	),
	      	decoration: BoxDecoration(
	      		color: Colors.white,
	      	),
	      ),
	    ),
	    actions: <Widget>[
		    RaisedButton(
			    child: Text("NAVIGATE",textAlign: TextAlign.center,),
			    onPressed: (){
				    final String docName ='${Random().nextInt(10)}' + '  '+' ${DateTime.now()}';
				    CreatePolyline object = CreatePolyline(docName);
				    object.startRecord();
				    googleMapNavigation();
				    Navigator.of(context).pop();
				    Navigator.push(context,
						    MaterialPageRoute(builder: (context)=>DuringNavigation(object , docName))
				    );
			    },
		    ),
	    ],
		);
  }
}