import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:transparent_image/transparent_image.dart';

import 'package:kanye_westdom/utilities/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({this.kaneyQuote, this.bgImage});

  final kaneyQuote;
  final bgImage;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String quote = '';
  String bgImage = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.kaneyQuote, widget.bgImage);
  }

  void updateUI(dynamic myQuote, dynamic myImage){
    setState(() {
      if(myQuote == null){
        quote = 'Unable to get wisdom from Yeezus.';
        return;
      }
      quote = myQuote['quote'];
      int index = Random().nextInt(myImage['data'].length - 1);
      bgImage = myImage['data'][index]['path'];
      print(bgImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(bgImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
            )
          ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  color: Colors.white.withOpacity(0.6),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
                    child: Text(
                      quote,
                      style: kQuoteTextStyle,
                    ),
                  )
                )
              )
            ],
          ),
        ),
        )
    );
  }
}