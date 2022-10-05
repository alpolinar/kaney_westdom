import 'package:kanye_westdom/services/networking.dart';

class QuoteModel {
  Future<dynamic> getQuote() async{
    const String url = 'https://api.kanye.rest';
    NetworkHelper networkHelper = NetworkHelper(url);
    var quote = await networkHelper.getData();
    return quote;
  }
}