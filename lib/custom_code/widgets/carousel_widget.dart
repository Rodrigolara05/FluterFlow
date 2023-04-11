// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    Key? key,
    this.width,
    this.height,
    required this.jsonMenuItems,
    required this.baseURL,
    required this.vehicleId,
    required this.location,
    required this.imagePosition,
  }) : super(key: key);

  final double? width;
  final double? height;
  final dynamic jsonMenuItems;
  final String baseURL;
  final String vehicleId;
  final int location;
  final int imagePosition;

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List<CarouselItem> carouselItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    buildCarouselWidgets(widget.baseURL, widget.location, widget.vehicleId);
  }

  void buildCarouselWidgets(String baseURL, int location, String vehicleId) {
    for (var data in widget.jsonMenuItems) {
      carouselItems.add(CarouselItem(getFileFullPathString(
          data['imageBlogName'], location, baseURL, vehicleId)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      itemBuilder: (context, index, realIndex) {
        var item = carouselItems[index];
        var imageUrl = item.imageUrl;
        return GestureDetector(
          onTap: () {
            //context.pushNamed(route);
          },
          child: Column(
            children: [
              Expanded(
                  child:
                      Image.network(imageUrl, fit: BoxFit.contain, width: 900)),
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        initialPage: widget.imagePosition,
      ),
    );
  }
}

class CarouselItem {
  String imageUrl = "";

  CarouselItem(String imageUrl) {
    this.imageUrl = imageUrl;
  }
}
