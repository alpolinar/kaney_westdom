import 'package:kanye_westdom/services/networking.dart';

class BackgroundImageModel {
  Future<dynamic> getImage() async{
    const String url = 'https://wallhaven.cc/api/v1/collections/gemboy99/1333863';
    NetworkHelper networkHelper = NetworkHelper(url);
    var image = await networkHelper.getData();
    return image;
  }
}