import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kanye_westdom/services/background.dart';
import 'package:kanye_westdom/services/quote.dart';

import 'main_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getQuoteData();
  }

  void getQuoteData() async{
    var quote = await QuoteModel().getQuote();
    var image = await BackgroundImageModel().getImage();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return MainPage(
        kaneyQuote: quote,
        bgImage: image,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}